# HTTP Wrapper Interface

| Version | URI | WRAP Version |
|-|-|-|
| 1.0.0 | [`wrap://ens/wraps.eth:datetime@1.0.0`](https://wrappers.io/v/ens/wraps.eth:datetime@1.0.0) | 0.1 |

## Interface
```graphql
type Module {
  """
  Returns the numeric value corresponding to the current time—the
  number of milliseconds elapsed since January 1, 1970 00:00:00 UTC,
  with leap seconds ignored.
  """
  currentTimestamp: BigInt!
}
```

## Usage
```graphql
#import { Module } into Datetime from "ens/wraps.eth:datetime@1.0.0"

type Module implements Datetime_Module {}
```

And implement the `currentTimestamp` method within your programming language of choice.

## Source Code
[Link](https://github.com/polywrap/datetime)

## Known Implementations
[Link](https://github.com/polywrap/datetime/tree/master/implementations)
