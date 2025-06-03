// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let kivy = true
let local = false

let pykit_package: Package.Dependency = if local {
    .package(path: "../PySwiftKit")
} else {
    if kivy {
        .package(url: "https://github.com/KivySwiftLink/PySwiftKit", from: .init(311, 0, 0))
    } else {
        .package(url: "https://github.com/PythonSwiftLink/PySwiftKit", from: .init(311, 0, 0))
    }
}

let pyfile_package: Package.Dependency = if local {
    .package(path: "../PyFileGenerator")
} else {
    .package(url: "https://github.com/PythonSwiftLink/PyFileGenerator", from: .init(0, 0, 1))
}

var platforms: [SupportedPlatform] = [.iOS(.v13), .macOS(.v11)]


let package = Package(
	name: "PyCoreBluetooth",
    platforms: platforms,
	products: [

		.library(name: "PyCoreBluetooth", targets: ["PyCoreBluetooth"]),

	],
	dependencies: [
        pykit_package,
        pyfile_package,
        //.package(path: "/Volumes/CodeSSD/TestCommand")
	],
	targets: [
		.target(
			name: "PyCoreBluetooth",
			dependencies: [
                .product(name: "SwiftonizeModules", package: "PySwiftKit"),
			]
		),
		
	]
)
