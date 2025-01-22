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
      switch self {
      case .regular:
        return "Pretendard-Regular"
      case .medium:
        return "Pretendard-Medium"
      case .semibold:
        return "Pretendard-SemiBold"
      case .bold:
        return "Pretendard-Bold"
      }
    }
  }
}

extension Pretendard {
  @discardableResult
  public static func registerFonts() throws -> Bool {
    try Weight.allCases.allSatisfy {
      try Pretendard.Weight.registerFont(
        bundle: .module,
        fontName: $0.fontName
      )
    }
  }
}

extension Pretendard.Weight {
  @discardableResult
  fileprivate static func registerFont(
    bundle: Bundle,
    fontName: String
  ) throws -> Bool {

    let fontExtension = fontName.contains("Pretendard") ? "otf" : "ttf"
    guard
      let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
      let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
      CGFont(fontDataProvider) != nil
    else {
      fatalError("Couldn't create font from filename: \(fontName).\(fontExtension)")
    }

    var error: Unmanaged<CFError>?

    let isSuccess = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)

    if let error = error?.takeUnretainedValue() {
      throw error
    }

    return isSuccess
  }
}
