import CoreBluetooth

import PySwiftKit
import PySerializing

import PySwiftWrapper
import PySwiftObject
import PyUnpack
import PyTypes

@PyClassByExtension(bases: [.hash, .str])
extension CBUUID: PySerializing.PySerializable, PySwiftKit.PyHashable, PySwiftKit.PyStrProtocol, PyClassProtocol {
    
    @PyMethod
    public static func create(string: String) -> Self {
        Self.init(string: string)
    }
    
    public func __hash__() -> Int {
        hashValue
    }
    
    public func __str__() -> String {
        uuidString
    }
    
    public var pyPointer: PyPointer { Self.asPyPointer(self) }
}
fileprivate var uuidbuffer_size = 1

public class CBUUIDBuffer {
//    public var buffer: PyBufferProcs = .init(bf_getbuffer: PyBuffer_get, bf_releasebuffer: PyBuffer_release)
//    //static var strides: Int =
//    public static var PyBuffer_get: getbufferproc = { s, buffer, rw -> Int32 in
//        let cls: CBUUID = UnPackPyPointer(from: s)
//        var data = cls.data
//        var size = data.count
//        return data.withUnsafeMutableBytes { raw in
//            if let buffer {
//                return raw.fill_info(buffer: buffer, o: s, size: &size, itemsize: &uuidbuffer_size)
//            }
//            return 0
//        }
//    }
    
    init() {
        
    }
    
}

extension CBUUID {
//    private static let py_buffer = CBUUIDBuffer()
//    public func buffer_procs() -> UnsafeMutablePointer<PyBufferProcs> {
//        Self.py_buffer.buffer_procs()
//    }
//    
}

extension CBUUID {
    
    
//    
//    public func __buffer__(_ s: PythonCore.PyPointer, _ buffer: UnsafeMutablePointer<Py_buffer>) -> Int32 {
//        var data = self.data
//        return data.withUnsafeMutableBytes { raw in
//            PyBuffer_FillInfo(
//                buffer,
//                s,
//                raw.baseAddress,
//                raw.count,
//                buffer.pointee.readonly,
//                PyBUF_WRITE
//            )
//        }
//        
//    }
    
    
}
