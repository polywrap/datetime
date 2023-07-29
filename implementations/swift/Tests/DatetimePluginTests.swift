import XCTest
@testable import DatetimePlugin
import PolywrapClient

final class swiftTests: XCTestCase {
    func testCurrentTimestamp() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let uri = try Uri("plugin/http")
        let datetimePlugin = getDatetimePlugin()
        let package = PluginPackage(datetimePlugin)
        let client = BuilderConfig().addPackage(uri, package).build()
        let expectedTimestamp = Int(Date().timeIntervalSince1970 * 1000)
        let timestamp: String = try client.invoke(uri: uri, method: "currentTimestamp", args: ArgsCurrentTimestamp(), env: nil)
        let timestampInt = Int(timestamp)!
        XCTAssertTrue(abs(expectedTimestamp - timestampInt) <= 10, "Timestamp difference is more than acceptable range")
    }
}