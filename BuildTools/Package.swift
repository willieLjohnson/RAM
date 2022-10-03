// swift-tools-version:5.7.0
import PackageDescription

let package = Package(
  name: "BuildTools",
  dependencies: [
    .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8"),
    .package(url: "https://github.com/Realm/SwiftLint", from: "0.28.1"),
  ],
  targets: [
    .target(
      name: "BuildTools",
      path: ""
    ),
  ]
)
