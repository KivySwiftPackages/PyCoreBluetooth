// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let local = false

let pykit_package: Package.Dependency = if local {
    .package(path: "../PySwiftKit")
} else {
    .package(url: "https://github.com/KivySwiftLink/PySwiftKit", from: .init(311, 0, 0))
}

let pyfile_package: Package.Dependency = if local {
    .package(path: "../PyFileGenerator")
} else {
    .package(url: "https://github.com/PythonSwiftLink/PyFileGenerator", from: .init(0, 0, 1))
}


let package = Package(
	name: "PyCoreBluetooth",
	platforms: [.iOS(.v13)],
	products: [

		.library(name: "PyCoreBluetooth", targets: ["PyCoreBluetooth"]),

	],
	dependencies: [
        pykit_package,
        pyfile_package
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
