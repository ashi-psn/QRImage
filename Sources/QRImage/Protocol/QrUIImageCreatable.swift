#if !os(macOS)
import UIKit
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
