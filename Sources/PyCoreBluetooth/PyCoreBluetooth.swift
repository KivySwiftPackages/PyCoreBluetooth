import CoreBluetooth

import PySwiftKit
import PySerializing

import PySwiftWrapper
import PySwiftObject

extension UUID: PySerializing.PySerialize {

    public var pyPointer: PyPointer {
        uuidString.pyPointer
    }
    
    
}


@PyModule
public struct PyCorebluetooth: PyModuleProtocol {
    static var py_classes: [any (PyClassProtocol & AnyObject).Type] = [
        CBUUID.self,
        CBPeripheral.self,
        CBCharacteristic.self,
        CBService.self,
        CBDescriptor.self,
        CBL2CAPChannel.self,
        CBCentralManager.self,
        PyCBCentralManager.self,
        PyCBPeripheralCallback.self,
        CBCentralManagerCallback.self
    ]
    
    //@PyFunction
    public static func peripheral_callback(cls: PyPointer) throws -> ()throws->PyCBPeripheralCallback {
        {try .init(object: cls) }
    }
}

extension PySwiftModuleImport {
    public static let py_corebluetooth = PySwiftModuleImport(name: "py_corebluetooth", module: PyCorebluetooth.py_init)
}
