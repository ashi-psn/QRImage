#if !os(iOS)
import CoreImage
import AppKit

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
#endif

