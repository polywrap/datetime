# @polywrap/datetime-plugin-js
The Datetime plugin implements the `datetime-interface` @ [ens/wraps.eth:datetime@1.0.0](https://app.ens.domains/name/wraps.eth/details) (see [./src/schema.graphql](./src/schema.graphql)). It provides access to the current unix timestamp of the host operating system.

## Usage
### 1. Configure Client
When creating your Polywrap JS client, add the datetime plugin:
```typescript
import { ClientConfigBuilder } from "@polywrap/client-config-builder-js";
import { PolywrapClient } from "@polywrap/client-js";
import { datetimePlugin } from "@polywrap/datetime-plugin-js";

const config = new ClientConfigBuilder()
  // 1. Add the plugin package @ an arbitrary URI
  .addPackage(
    "plugin/datetime",
    datetimePlugin({ })
  )
  // 2. Register this plugin as an implementation of the interface
  .addInterfaceImplementation(
    "ens/wraps.eth:datetime@1.0.0",
    "plugin/datetime"
  )
  // 3. Redirect invocations @ the interface to the plugin (default impl)
  .addRedirect(
    "ens/wraps.eth:datetime@1.0.0",
    "plugin/datetime"
  )
  .build();

const client = new PolywrapClient(config);
```

### 2. Invoke the Datetime Plugin
Invocations to the datetime plugin can be made via the interface URI (which will get redirected), or the plugin's URI directly:
```typescript
await client.invoke({
  uri: "ens/wraps.eth:datetime@1.0.0" | "plugin/datetime",
  method: "currentTimestamp"
});
```
