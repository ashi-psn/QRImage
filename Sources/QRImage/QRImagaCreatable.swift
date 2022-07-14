import Foundation
import CoreImage
import SwiftUI

#if !os(macOS)
import UIKit
#endif

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

#if !os(macOS)
protocol QrUIImageCreatable: QRImagaCreatable {
    func makeUIImage() -> UIImage?
}

extension QrUIImageCreatable {
    func makeUIImage() -> UIImage? {
        guard let cgImage = makeCGImage() else { return nil }
        
        let image = UImage(cgImage: cgImage)
        
        return image
    }
}
#endif

protocol QRNSImageCreatable: QRImagaCreatable {
    func makeNSImage() -> NSImage?
}

extension QRNSImageCreatable {
    func makeNSImage() -> NSImage? {
        guard let cgImage = makeCGImage() else { return nil }
        
        let image = NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height))
        
        return image
    }
}
