# swift-pretendard

- Swift에서 사용할 수 있는 system-ui 대체 글꼴 [Pretendard](https://github.com/orioncactus/pretendard)
- 한글에서는 Pretendard Font를 사용하고 영문에서는 Poppins 를 사용하도록 추가 수정
- `only_pretendard` branch에서 poppins 폰트를 제거하고 Pretendard만 사용하도록 수정

## 설치

`Package.swift` 파일에 하기와 같은 코드를 추가합니다.

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/wonkwh/swift-pretendard", from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: [
                .product(name: "Pretendard", package: "swift-pretendard") // Add as a dependency
            ]
        )
    ]
)
```

### Register Font

```swift
  func registerFont() {
    do {
      try Pretendard.registerFonts()
    } catch  {
      fatalError()
    }
  }
```

## 지원 기능

- Pretendard CJK 폰트, Poppins Font 지원
- 가장 많이 사용되는 4개의 Weight를 제공.
  - Bold
  - Medium
  - Regular
  - Semi Bold

