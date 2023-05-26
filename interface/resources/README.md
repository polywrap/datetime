# Datetime Wrapper Interface

| Version | URI | WRAP Version |
|-|-|-|
| 1.0.0 | [`wrap://ens/wraps.eth:datetime@1.0.0`](https://wrappers.io/v/ens/wraps.eth:datetime@1.0.0) | 0.1 |

## Interface
```graphql
type Module {
    # Create a new datetime object for the current date and time.
    now: Datetime

    # Get the difference between two datetime objects.
    diff(other: Datetime!): Datetime!

    # Format the datetime object into a string.
    format(datetime: Datetime!, fmt: String): String!

    # Parse a string into a datetime object.
    parse(datetimeStr: String!, fmt: String): Datetime!

    # Add a duration to the datetime.
    add(duration: Duration!): Datetime!

    # Subtract a duration from the datetime.
    subtract(duration: Duration!): Datetime!

    # Get the Unix timestamp of the datetime.
    toUnixTimestamp: UInt!

    # Create a new datetime object from a Unix timestamp.
    fromUnixTimestamp(timestamp: UInt!): Datetime
}

type Datetime {
    year: Int!
    month: Int!
    day: Int!
    hour: Int!
    minute: Int!
    second: Int!
    millisecond: Int!
}

type Duration {
    years: Int
    months: Int
    days: Int
    hours: Int
    minutes: Int
    seconds: Int
    milliseconds: Int
}
```

## Usage
```graphql
#import * from "ens/wraps.eth:datetime@1.0.0"
```

And implement the interface methods within your programming language of choice.

## Source Code
[Link](https://github.com/polywrap/std/datetime)

## Known Implementations
[Link](https://github.com/polywrap/datetime/tree/master/implementations)