import PolywrapClient
import Foundation

public struct ArgsCurrentTimestamp: Codable {
    
}

public class DatetimePlugin: Plugin {
    public override init() {
        super.init()
        super.addMethod(name: "currentTimestamp", closure: currentTimestamp)
    }
    
    public func currentTimestamp(_ args: ArgsCurrentTimestamp) async -> String {
        let currentTimeMillis = Int(Date().timeIntervalSince1970 * 1000)
        let currentTimeMillisString = String(currentTimeMillis)
        return currentTimeMillisString
    }
}
