import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing
import PyUnpack

extension CBCharacteristicWriteType: PySerializing.PySerializable {}


@PyClassByExtension(bases: [.str, .hash], expr: """
    
    open var uuid: CBUUID { get }
    
    weak open var service: CBService? { get }
    
    //open var properties: CBCharacteristicProperties { get }
    
    open var value: Data? { get }
    
    open var descriptors: [CBDescriptor]? { get }
    
    open var isBroadcasted: Bool { get }
    
    open var isNotifying: Bool { get }
        
""")
extension CBCharacteristic: PySerializing.PySerializable, PySwiftKit.PyHashable, PySwiftWrapper.PyClassProtocol, PySwiftKit.PyStrProtocol {
    
    public func __hash__() -> Int { uuid.hash }
    
    public func __str__() -> String {
        uuid.uuidString
    }
   
}

extension PySerialize where Self: CBCharacteristic {
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
