import PolywrapClient
import Foundation

public class DatetimePlugin: Plugin {
    public init() {}
    
    public func currentTimestamp(_ args: ArgsCurrentTimestamp, _ env: VoidCodable?, _ invoker: Invoker) throws -> String {
        let currentTimeMillis = Int(Date().timeIntervalSince1970 * 1000)
        let currentTimeMillisString = String(currentTimeMillis)
        return currentTimeMillisString
    }
}
