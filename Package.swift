// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RefreshableScrollView",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "RefreshableScrollView", targets: ["RefreshableScrollView"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "RefreshableScrollView", dependencies: []),
  ]
)
