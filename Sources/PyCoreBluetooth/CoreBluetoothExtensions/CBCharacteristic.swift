import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing
import PyUnpack

extension CBCharacteristicWriteType: PySerializing.PySerializable {}


@PyClassByExtension(bases: [.str, .hash, .repr], expr: """
    
    open var uuid: CBUUID { get }
    
    weak open var service: CBService? { get }
    
    //open var properties: CBCharacteristicProperties { get }
    
    open var value: Data? { get }
    
    open var descriptors: [CBDescriptor]? { get }
    
    open var isBroadcasted: Bool { get }
    
    open var isNotifying: Bool { get }
        
""")
extension CBCharacteristic: PySerializing.PySerializable, PySwiftKit.PyHashable, PySwiftWrapper.PyClassProtocol, PySwiftKit.PyStrProtocol, PySwiftKit.PyReprProtocol {
    
    public func __hash__() -> Int { uuid.hash }
    
    public func __str__() -> String {
        uuid.uuidString
    }
    
    public func __repr__() -> String {
        uuid.description
    }
    
    func test() {
        UnPackPySwiftObject(with: .none, as: CBCharacteristic.self)
    }
    
//    @PyMethod
//    static func create(uuid: String, primary: Bool) -> CBService {
//        let new = CBMutableCharacteristic(type: <#T##CBUUID#>, properties: ., value: <#T##Data?#>, permissions: <#T##CBAttributePermissions#>)
//        return new
//    }
   
}

extension PySerialize where Self: CBCharacteristic {
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
