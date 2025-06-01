//

import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing

@PyClassByExtension(
    bases: [.hash, .str, .repr],
    expr: """
    
    weak open var peripheral: CBPeripheral? { get }

    open var isPrimary: Bool { get }

    open var includedServices: [CBService]? { get }

    open var characteristics: [CBCharacteristic]? { get }
    
    """
)
extension CBService: PySerializing.PySerialize, PySerializing.PyDeserialize, PySwiftKit.PyHashable, PySwiftWrapper.PyClassProtocol, PySwiftKit.PyReprProtocol {
    
    public func __hash__() -> Int {
        uuid.hashValue
    }
    
    public func __str__() -> String {
        uuid.uuidString
    }
    
    public func __repr__() -> String {
        uuid.description
    }
    
    @PyMethod
    static func create(uuid: String, primary: Bool) -> CBService {
        let new = CBMutableService(type: .init(string: uuid), primary: primary)
        return new
    }
}

/* hack:
 since CBMutableService inherits from CBService
 then pyPointer cant defined in extensions of both classes
 this hack will still fill out required pyPointer
 but once same done in CBMutableService it just overrides it
*/
extension PySerialize where Self: CBService {
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
//extension PyDeserialize where Self: CBService {
//    public static func casted(from object: PyPointer) throws -> PyDeserialize {
//        #ExtractPySwiftObject
//    }
//}

//@PyClassByExtension
//extension CBMutableService {
//}

//extension PySerialize where Self: CBMutableService {
//    public var pyPointer: PyPointer {
//        Self.asPyPointer(self)
//    }
//}


