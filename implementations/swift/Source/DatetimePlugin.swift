import PolywrapClient
import Foundation

public class DatetimePlugin: Plugin {
    public var methodsMap: [String: PluginMethod] = [:]

    public func currentTimestamp(_ args: ArgsCurrentTimestamp, _ env: VoidCodable?, _ invoker: Invoker) throws -> String {
        let currentTimeMillis = Int(Date().timeIntervalSince1970 * 1000)
        let currentTimeMillisString = String(currentTimeMillis)
        return currentTimeMillisString
    }
}

public func getDatetimePlugin() -> Plugin {
    var plugin = DatetimePlugin()
    plugin.addMethod(name: "currentTimestamp", closure: plugin.currentTimestamp)
    return plugin
}