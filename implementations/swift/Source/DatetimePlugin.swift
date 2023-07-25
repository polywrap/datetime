import PolywrapClient
import Foundation

public struct ArgsCurrentTimestamp: Codable {
    
}

public class DatetimePlugin: PluginModule {
    public override init() {}
    
    public func currentTimestamp(_ args: ArgsCurrentTimestamp) -> String {
        let currentTimeMillis = Int(Date().timeIntervalSince1970 * 1000)
        let currentTimeMillisString = String(currentTimeMillis)
        return currentTimeMillisString
    }
}
