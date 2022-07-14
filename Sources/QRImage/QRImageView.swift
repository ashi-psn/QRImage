#if !os(macOS)
import UIKit

public class QRImageView: UIImageView {
    
    override func layoutSubviews() {
       super.layoutSubviews()
        
        self.image = makeUIImage()
    }
}

extension QRImageView: QrUIImageCreatable{}

#endif
