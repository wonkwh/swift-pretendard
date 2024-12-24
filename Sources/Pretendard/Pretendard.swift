import CoreText
import Foundation

public enum Pretendard {}

extension Pretendard {

    public enum Weight: String, CaseIterable {
        case regular
        case medium
        case semibold
        case bold

        public var fontName: String {
            let isKorean = Locale.current.languageCode == "ko"
            switch self {
            case .regular:
              return  isKorean ? "Pretendard-Regular" : "Poppins-Regular"
            case .medium:
              return isKorean ? "Pretendard-Medium" : "Poppins-Medium"
            case .semibold:
              return isKorean ? "Pretendard-SemiBold" : "Poppins-SemiBold"
            case .bold:
              return isKorean ? "Pretendard-Bold" : "Poppins-Bold"
            }
        }
    }
}

extension Pretendard {
    @discardableResult
    public static func registFonts() throws -> Bool {
        try Weight.allCases.allSatisfy {
            try Pretendard.Weight.registerFont(
                bundle: .module,
                fontName: $0.fontName,
                fontExtensions: ["otf", "ttf"]
            )
        }
    }
}

extension Pretendard.Weight {
    @discardableResult
    fileprivate static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtensions: [String]
    ) throws -> Bool {

      var isSuccess = false
      for fontExtension in fontExtensions {
        guard
            let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let _ = CGFont(fontDataProvider)
        else {
            fatalError("Couldn't create font from filename: \(fontName).\(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        
        isSuccess = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        
        if let error = error?.takeUnretainedValue() {
            throw error
        }
      }
        
        return isSuccess
    }
}
