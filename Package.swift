// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let kivy = false
let use_psk = true
let local = true

let pykit_package: Package.Dependency = if local {
    .package(path: "/Users/codebuilder/Documents/GitHub/PySwiftKit")
} else {
    .package(url: "https://github.com/KivySwiftLink/PySwiftKit", from: .init(311, 0, 0))
}


let psw: Package.Dependency = if local {
    .package(path: "/Volumes/CodeSSD/PythonSwiftGithub/PySwiftWrapper")
} else {
    .package(path: "/Volumes/CodeSSD/PythonSwiftGithub/PySwiftWrapper")
}

let pykit: Target.Dependency = if use_psk {
    .product(name: "SwiftonizeModules", package: "PySwiftKit")
} else {
    .product(name: "SwiftonizeModules", package: "PythonSwiftLink")
}




let package = Package(
	name: "PyCoreBluetooth",
	platforms: [.iOS(.v13)],
	products: [

		.library(name: "PyCoreBluetooth", targets: ["PyCoreBluetooth"]),

	],
	dependencies: [
        pykit_package,
        psw,
        .package(path: "../PyFileGenerator")
	],
	targets: [
		.target(
			name: "PyCoreBluetooth",
			dependencies: [
                pykit,
                .product(name: "PySwiftWrapper", package: "PySwiftWrapper")
			]
		),
		
	]
)
