#if canImport(SwiftUI)
import SwiftUI

extension Font {
  public static func pretendard(
    ofSize fontSize: CGFloat,
    weight: Pretendard.Weight = .regular
  ) -> Font {
    .custom(weight.fontName, size: fontSize)
  }
}
#endif
