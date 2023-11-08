//
//  PyBT+Extensions.swift
//  php_app
//
//  Created by MusicMaker on 06/04/2023.
//

import Foundation
import CoreBluetooth
import PythonSwiftCore

extension CBService: PyConvertible, PyHashable {
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBService(self) }
    public var __hash__: Int { uuid.hash }
}
extension CBService: CBService_PyProtocol {
	public func __repr__() -> String { description }
    
	public func __str__() -> String { description }
    
}

public func PyDict_GetItem(_ dict: PyPointer?, _ key: String) throws -> CBPeripheral {
	try key.withCString {
		guard let dict = dict, let ptr = PyDict_GetItemString(dict, $0) else { throw PythonError.attribute }
		defer { Py_DecRef(ptr) }
		return try UnPackPyPointer(with: CBPeripheralPyType.pytype, from: ptr)
	}
}

@inlinable public func PyTuple_GetItem(_ object: PyPointer?,_ index: Int) throws -> CBPeripheral {
	guard let ptr = PyTuple_GetItem(object, index) else { throw PythonError.attribute }
	return UnPackPyPointer(from: ptr)
}

public func PyDict_GetItem(_ dict: PyPointer?, _ key: String) throws -> CBCharacteristic {
	try key.withCString {
		guard let dict = dict, let ptr = PyDict_GetItemString(dict, $0) else { throw PythonError.attribute }
		defer { Py_DecRef(ptr) }
		return try UnPackPyPointer(with: CBPeripheralPyType.pytype, from: ptr)
	}
}

@inlinable public func PyTuple_GetItem(_ object: PyPointer?,_ index: Int) throws -> CBCharacteristic {
	guard let ptr = PyTuple_GetItem(object, index) else { throw PythonError.attribute }
	return UnPackPyPointer(from: ptr)
}

var temp_storage_service: CBService?

extension CBPeripheral: PyConvertible, CBPeripheral_PyProtocol, PyHashable {
    
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBPeripheral(self) }
    public var __hash__: Int { identifier.hashValue }
	public func __str__() -> String { name ?? identifier.uuidString }
	public func __repr__() -> String { description }
}

extension CBCharacteristic: PyConvertible, PyHashable {
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBCharacteristic(self) }
    public var __hash__: Int { uuid.hash }
}

extension CBCharacteristic: CBCharacteristic_PyProtocol {
	public func __repr__() -> String { description }
	public func __str__() -> String { description }
}

extension CBDescriptor: PyConvertible, PyHashable, CBDescriptor_PyProtocol {
	public func __repr__() -> String {
        description
    }
    
	public func __str__() -> String {
        description
    }
    
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBDescriptor(self) }
    public var __hash__: Int { uuid.hash }
}

extension CBL2CAPChannel: PyConvertible {
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBL2CAPChannel(self) }
}

extension CBUUID: PyConvertible, PyHashable {
    public var pyObject: PythonObject { .init(getter: pyPointer) }
    public var pyPointer: PyPointer { create_pyCBUUID(self) }
    public var __hash__: Int { hashValue }
}

extension CBUUID: CBUUID_PyProtocol {
	public func __repr__() -> String { description }
	public func __str__() -> String { description }
}



extension PyCBPeripheralDelegate {
	public func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
		self.peripheral(peripheral, didReadRSSI: Int(truncating: RSSI), error: error)
    }
}

extension CBPeripheral {
    
    var _state: Int { state.rawValue }
    
}

