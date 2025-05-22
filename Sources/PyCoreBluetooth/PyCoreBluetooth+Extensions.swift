//
//  PyBT+Extensions.swift
//  php_app
//
//  Created by MusicMaker on 06/04/2023.
//

import Foundation
import CoreBluetooth

import PySwiftWrapper

import PySwiftKit
import PySwiftObject

import PySerializing
import PyCallable
import PyUnpack




extension UnsafeMutablePointer<CChar> {
    static let ubyte_format: Self = makeCString(from: "B")
}


//
//public func PyDict_GetItem(_ dict: PyPointer?, _ key: String) throws -> CBPeripheral {
//	try key.withCString {
//		guard let dict = dict, let ptr = PyDict_GetItemString(dict, $0) else { throw PythonError.attribute }
//		defer { Py_DecRef(ptr) }
//		return try UnPackPyPointer(with: CBPeripheralPyType.pytype, from: ptr)
//	}
//}
//
//@inlinable public func PyTuple_GetItem(_ object: PyPointer?,_ index: Int) throws -> CBPeripheral {
//	guard let ptr = PyTuple_GetItem(object, index) else { throw PythonError.attribute }
//	return UnPackPyPointer(from: ptr)
//}
//
//public func PyDict_GetItem(_ dict: PyPointer?, _ key: String) throws -> CBCharacteristic {
//	try key.withCString {
//		guard let dict = dict, let ptr = PyDict_GetItemString(dict, $0) else { throw PythonError.attribute }
//		defer { Py_DecRef(ptr) }
//		return try UnPackPyPointer(with: CBPeripheralPyType.pytype, from: ptr)
//	}
//}
//
//@inlinable public func PyTuple_GetItem(_ object: PyPointer?,_ index: Int) throws -> CBCharacteristic {
//	guard let ptr = PyTuple_GetItem(object, index) else { throw PythonError.attribute }
//	return UnPackPyPointer(from: ptr)
//}
//


