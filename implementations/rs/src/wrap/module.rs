/// NOTE: This is an auto-generated file.
///       All modifications will be overwritten.

use std::sync::Arc;
use polywrap_core::invoker::Invoker;
use polywrap_plugin::{error::PluginError, module::PluginModule};
use polywrap_msgpack_serde::{
  to_vec,
  from_slice,
  JSON,
  bytes::ByteBuf,
  JSONString
};
use std::collections::BTreeMap;
use serde::{Serialize, Deserialize};
use super::types::*;

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ArgsCurrentTimestamp {
}

pub trait Module: PluginModule {
  fn current_timestamp(&mut self, args: &ArgsCurrentTimestamp, invoker: Arc<dyn Invoker>) -> Result<BigInt, PluginError>;
}
