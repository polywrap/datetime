use crate::wrap::wrap_info::get_manifest;
use chrono::Utc;
use polywrap_core::invoker::Invoker;
use polywrap_plugin::{error::PluginError, implementor::plugin_impl};
use std::sync::Arc;
use wrap::{module::{ArgsCurrentTimestamp, Module}, types::BigInt};

pub mod wrap;

#[derive(Debug)]
pub struct DatetimePlugin;

#[plugin_impl]
impl Module for DatetimePlugin {
    fn current_timestamp(
        &mut self,
        _: &ArgsCurrentTimestamp,
        _: Arc<dyn Invoker>,
    ) -> Result<BigInt, PluginError> {
        let now = Utc::now().timestamp();
        Ok(now.to_string())
    }
}

#[cfg(test)]
mod test {
    use std::sync::Arc;

    use chrono::Utc;
    use polywrap_client::client::PolywrapClient;
    use polywrap_core::{client::ClientConfig, uri::Uri};
    use polywrap_msgpack_serde::to_vec;
    use polywrap_plugin::package::PluginPackage;
    use polywrap_resolvers::static_resolver::{StaticResolver, StaticResolverLike};
    use serde::Serialize;

    use crate::{wrap::module::ArgsCurrentTimestamp, DatetimePlugin};

    #[derive(Serialize)]
    pub struct CurrentTimestampArgs {}

    #[test]
    fn retrieves_current_datetime() {
        let datetime_plugin = DatetimePlugin {};
        let plugin_pkg: PluginPackage<DatetimePlugin> = datetime_plugin.into();
        let package = Arc::new(plugin_pkg);

        let uri = Uri::try_from("plugin/datetime").unwrap();

        let resolver =
            StaticResolver::from(vec![StaticResolverLike::Package(uri.clone(), package)]);

        let client = PolywrapClient::new(ClientConfig {
            resolver: Arc::new(resolver),
            interfaces: None,
            envs: None,
        });

        let response = client.invoke::<String>(
            &uri,
            "currentTimestamp",
            Some(&to_vec(&ArgsCurrentTimestamp {}).unwrap()),
            None,
            None,
        );
        assert_eq!(response.unwrap(), Utc::now().timestamp().to_string())
    }
}
