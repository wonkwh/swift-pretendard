#if canImport(UIKit)
import UIKit

extension UIFont {
  public static func pretendard(
    ofSize fontSize: CGFloat,
    weight: Pretendard.Weight = .regular
  ) -> UIFont? {
    UIFont(name: weight.fontName, size: fontSize)
  }
}
#endif
