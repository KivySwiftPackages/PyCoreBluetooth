//
//  CBDescriptor.swift
//  PyCoreBluetooth
//
//  Created by CodeBuilder on 08/05/2025.
//
import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing

@PyClassByExtension(
    expr: """
    weak open var characteristic: CBCharacteristic? { get }

    //open var value: Any? { get }
    """
)
extension CBDescriptor: PySerializing.PySerializable, PySwiftWrapper.PyClassProtocol {
    
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
    
}
extension PyDeserialize where Self: CBDescriptor {
    public init(object: PyPointer) throws {
        fatalError()
    }
}
