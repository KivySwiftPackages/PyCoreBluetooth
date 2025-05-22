import Foundation
import CoreBluetooth
import PySwiftKit
import PySwiftObject
import PySwiftWrapper
import PySerializing


@PyClassByExtension(
    expr: """
    
    //open var peer: CBPeer! { get }
    
    //open var inputStream: InputStream! { get }
    
    //open var outputStream: OutputStream! { get }
    
    open var psm: CBL2CAPPSM { get }
    
    """
)
extension CBL2CAPChannel: PySerializing.PySerializable, PySwiftKit.PyHashable, PySwiftWrapper.PyClassProtocol {
    public func __hash__() -> Int {
        hashValue
    }
   
}

extension PySerialize where Self: CBL2CAPChannel {
    public var pyPointer: PyPointer {
        Self.asPyPointer(self)
    }
}
