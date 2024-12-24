import XCTest

@testable import Pretendard

final class PretendardTests: XCTestCase {
  func testRegisterFonts() throws {
    let isSuccess = try Pretendard.registerFonts()
    XCTAssertTrue(isSuccess)
  }
}
