import SwiftUI

#if !os(macOS)
import UIKit
#endif

@available(macOS 10.15.0, *)
public struct QRImage: View {
    
    public let qrString: String
    public var scale: Scale = Scale(x: 1.0, y: 1.0)
    public var correctionLevel: InputCorrectionLevel = .Medium
    
    
    public var body: some View {
        
        #if !os(macOS)
        if let cgImage = makeUIImage() {
            Image(cgImage: cgImage)
        }
        #else
        if let nsImage = makeNSImage() {
            Image(nsImage: nsImage)
        }
        #endif
    }
}

#if !os(macOS)
extension QRImage: QrUIImageCreatable{}
#endif

@available(macOS 10.15.0, *)
extension QRImage: QRNSImageCreatable {}

