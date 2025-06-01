//
//  CBPeripheral.swift
//  PyCoreBluetooth
//
//  Created by CodeBuilder on 07/05/2025.
//
import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing
import PyCallable
import PyUnpack

extension CBPeripheralState: PySerializing.PySerialize {

}


// copied from swift header
@PyClassByExtension(bases: [.str, .hash],expr: """

    open var identifier: UUID { get }

    //weak open var delegate: (any CBPeripheralDelegate)?

    open var name: String? { get }

    open var state: CBPeripheralState { get }

    open var services: [CBService]? { get }

    open var canSendWriteWithoutResponse: Bool { get }

    open var ancsAuthorized: Bool { get }

    open func readRSSI()

    open func discoverServices(_ serviceUUIDs: [CBUUID]?)

    open func discoverIncludedServices(_ includedServiceUUIDs: [CBUUID]?, for service: CBService)

    open func discoverCharacteristics(_ characteristicUUIDs: [CBUUID]?, for service: CBService)

    //open func readValue(for characteristic: CBCharacteristic)

    open func maximumWriteValueLength(for type: CBCharacteristicWriteType) -> Int

    //open func writeValue(_ data: Data, for characteristic: CBCharacteristic, type: CBCharacteristicWriteType)
    
    //open func writeValue(_ data: Data, for descriptor: CBDescriptor)

    open func setNotifyValue(_ enabled: Bool, for characteristic: CBCharacteristic)

    open func discoverDescriptors(for characteristic: CBCharacteristic)

    //open func readValue(for descriptor: CBDescriptor)

    open func openL2CAPChannel(_ PSM: CBL2CAPPSM)

""")
extension CBPeripheral: PySerializing.PySerializable, PySwiftWrapper.PyClassProtocol {
    
    
    
    @PyMethod
    func get_delegate() -> PyPointer? {
        (delegate as? PyCBPeripheralCallback)?.pyPointer
    }
    
    @PyMethod
    func set_delegate(delegate: PyCBPeripheralCallback?) {
        self.delegate = delegate
    }
    
    @PyMethod(kwargs: .kw_only)
    func readValue(kwargs: [String:PyPointer]) throws {
        
        if let characteristic = kwargs["characteristic"] {
            
            readValue(for: try PyCast<CBCharacteristic>.cast(from: characteristic))
            
        } else if let descriptor = kwargs["descriptor"] {
            
            readValue(for: try PyCast<CBDescriptor>.cast(from: descriptor))
            
        }
    }
    
    @PyMethod(kwargs: .kw_only)
    func writeValue(kwargs: [String:PyPointer]) throws {
        
        if let characteristic = kwargs["characteristic"] {
            guard let data = kwargs["value"] else { return }
            
            writeValue(try Data(object: data), for: try PyCast.cast(from: characteristic), type: .withResponse)
            
        } else if let descriptor = kwargs["descriptor"] {
            guard let data = kwargs["value"] else { return }
            
            writeValue(try Data(object: data), for: try PyCast.cast(from: descriptor))
        }
        
    }
    
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
    
}


extension CBPeripheral: PySwiftKit.PyStrProtocol {
    public func __str__() -> String {
        name ?? self.identifier.uuidString
    }
}

extension CBPeripheral: PySwiftKit.PyHashable {
    public func __hash__() -> Int {
        identifier.hashValue
    }
}
