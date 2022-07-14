import Foundation
import CoreImage
import SwiftUI

protocol QRImagaCreatable {
    var qrString: String { get }
    var scale: Scale { get }
    var correctionLevel: InputCorrectionLevel { get }
    func makeCGImage() -> CGImage?
}

extension QRImagaCreatable {
    func makeCGImage() -> CGImage? {
        guard let data = qrString.data(using: .utf8) else { return nil }

        guard let qr = CIFilter(
            name: "CIQRCodeGenerator",
            parameters: [
                "imputMessage" : data,
                "inputCorrectionLevel" : correctionLevel
            ]) else { return nil }

        let sizeTransform = CGAffineTransform(scaleX: scale.x, y: scale.y)

        guard let ciImage = qr.outputImage?.transformed(by: sizeTransform) else { return nil }

        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else { return nil }
        return cgImage
    }
}
