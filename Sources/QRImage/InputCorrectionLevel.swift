import Foundation

/// QRCode InputCorrectionLevel
/// - Low: 7%
/// - Medium: 15%
/// - Quartile: 25%
/// - High: 30%
public enum InputCorrectionLevel: String {
    case Low = "L"
    case Medium = "M"
    case Quartile = "Q"
    case High = "H"
}
