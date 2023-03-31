import XCTest
@testable import DatetimePlugin

final class swiftTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        print(await DatetimePlugin().currentTimestamp(ArgsCurrentTimestamp()))
//        XCTAssertEqual(DatetimePlugin()., "Hello, World!")
    }
}
