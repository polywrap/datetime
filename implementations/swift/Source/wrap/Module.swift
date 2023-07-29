// NOTE: This is an auto-generated file.
//       All modifications will be overwritten.

import PolywrapClient
import Foundation

public struct ArgsCurrentTimestamp: Codable {
}


public protocol Plugin: PluginModule {
    func currentTimestamp(_ args: ArgsCurrentTimestamp, _ env: VoidCodable?, _ invoker: Invoker) throws -> String
}
