import XCTest
@testable import DatetimePlugin

final class swiftTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let datetime = DatetimePlugin()
       XCTAssertEqual(datetime.currentTimestamp(ArgsCurrentTimestamp()), String(Int(Date().timeIntervalSince1970 * 1000)))
    }
}
