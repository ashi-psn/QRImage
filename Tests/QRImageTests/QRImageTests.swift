import XCTest
@testable import QRImage

final class QRImageTests: XCTestCase {
    
    let testString: String = "expext string value"
    
    func testmakeCGImage() throws {
        let _ = QRImage(qrString: testString)
    }
}
