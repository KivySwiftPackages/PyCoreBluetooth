// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PyCoreBluetooth",
	platforms: [.iOS(.v13)],
	products: [

		.library(name: "PyCoreBluetooth", targets: ["PyCoreBluetooth"]),

	],
	dependencies: [
        .package(url: "https://github.com/PythonSwiftLink/KivySwiftLink", from: .init(310, 0, 0)),
		.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 0))
	],
	targets: [
		.target(
			name: "PyCoreBluetooth",
			dependencies: [
				.product(name: "PythonSwiftCore", package: "KivySwiftLink"),
                .product(name: "PySwiftObject", package: "KivySwiftLink"),
			],
			plugins: [ .plugin(name: "Swiftonize", package: "SwiftonizePlugin") ]
		),
		
	]
)
