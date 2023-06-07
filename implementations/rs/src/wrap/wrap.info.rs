/// NOTE: This is an auto-generated file.
///       All modifications will be overwritten.
use polywrap_plugin::JSON::{from_value, json};
use wrap_manifest_schemas::versions::{WrapManifest, WrapManifestAbi};

pub fn get_manifest() -> WrapManifest {
  WrapManifest {
    name: "Datetime".to_string(),
    type_: "plugin".to_string(),
    version: "0.1".to_string(),
    abi: from_value::<WrapManifestAbi>(json!({
  "moduleType": {
    "kind": 128,
    "methods": [
      {
        "comment": "  Returns the numeric value corresponding to the current time—the\nnumber of milliseconds elapsed since January 1, 1970 00:00:00 UTC,\nwith leap seconds ignored.",
        "kind": 64,
        "name": "currentTimestamp",
        "required": true,
        "return": {
          "kind": 34,
          "name": "currentTimestamp",
          "required": true,
          "scalar": {
            "kind": 4,
            "name": "currentTimestamp",
            "required": true,
            "type": "BigInt"
          },
          "type": "BigInt"
        },
        "type": "Method"
      }
    ],
    "type": "Module"
  },
  "version": "0.1"
})).unwrap()
  }
}
