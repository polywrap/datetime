# Datetime
The Datetime interface wrapper defines a common interface for Datetime wrapper implementations. Implementations of the Datetime interface wrapper can fetch the current unix timestamp from the host. Implementations can be invoked by Wasm wrappers, extending their capabilities.

Table of Contents:
1. [Datetime Interface](./interface/resources/README.md)
2. [Datetime Implementations](./implementations)

## Usage

- **If you are a Wrapper Developer** - You just need to import the Datetime plugin with its registered uri and call the methods it provides like you would with any other imported wrapper.

  - Schema
    ```graphql
    #import * into Datetime from "wrap://ens/datetime.polywrap.eth"

    type Module{
      timestamp(): Int!
    }
    ```
  
  - Wasm-as
    ```ts
    import { 
      Datetime_Module,
      Args_timestamp
    } from "./wrap";

    export function timestamp(args: Args_timestamp): i32 {
      return Datetime_Module.currentTimestamp();
    }
    ```
  


- **If you are an App Developer** - You need to register the Datetime plugin using the client config.

```ts
const config = {
  ...,
  plugins: [
    ...
    {
      uri: "wrap://ens/datetime.polywrap.eth"
      plugin: DatetimePlugin()
    }
  ]
}
```