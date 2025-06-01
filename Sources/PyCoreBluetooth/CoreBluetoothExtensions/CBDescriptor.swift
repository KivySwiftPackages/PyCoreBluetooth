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
    bases: [.str,.repr],
    expr: """
    weak open var characteristic: CBCharacteristic? { get }

    //open var value: Any? { get }
    """
)
extension CBDescriptor: PySerializing.PySerializable, PySwiftWrapper.PyClassProtocol, PySwiftKit.PyReprProtocol, PySwiftKit.PyStrProtocol {
    
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
    public func __repr__() -> String {
        self.description
    }
    
    public func __str__() -> String {
        self.description
    }
}
extension PyDeserialize where Self: CBDescriptor {
    public init(object: PyPointer) throws {
        fatalError()
    }
}
