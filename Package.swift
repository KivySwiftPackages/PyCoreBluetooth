// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PyCoreBluetooth",
	platforms: [.iOS(.v13)],
	products: [

		.library(name: "PyCoreBluetooth", targets: ["PyCoreBluetooth"]),

	],
	dependencies: [
		.package(url: "https://github.com/PythonSwiftLink/KivySwiftLink", branch: "master"),
		.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 0))
		//.package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", branch: "main")
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
	
		.target(
			name: "PyCoreBluetooth",
			dependencies: [
				.product(name: "PythonSwiftCore", package: "KivySwiftLink"),
			],
			plugins: [ .plugin(name: "Swiftonize", package: "SwiftonizePlugin") ]
		),
		
	]
)
