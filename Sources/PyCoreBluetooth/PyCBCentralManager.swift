import CoreBluetooth

import PySwiftKit
import PySerializing

import PySwiftWrapper
import PySwiftObject
import PyUnpack

@PyClass
class TClass {
    
}

@PyClassByExtension(
    expr: """
    
    // from CBManager
    
    open var state: CBManagerState { get }

    @available(iOS 13.1, *)
    open var authorization: CBManagerAuthorization { get }
    
    // weak open var delegate: (any CBCentralManagerDelegate)?

    open var isScanning: Bool { get }

    //open class func supports(_ features: CBCentralManager.Feature) -> Bool

    //public convenience init()

    //public convenience init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?)


    //public init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?, options: [String : Any]? = nil)

    open func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [CBPeripheral]

    open func retrieveConnectedPeripherals(withServices serviceUUIDs: [CBUUID]) -> [CBPeripheral]

    //open func scanForPeripherals(withServices serviceUUIDs: [CBUUID]?, options: [String : Any]? = nil)

    open func stopScan()

    //open func connect(_ peripheral: CBPeripheral, options: [String : Any]? = nil)

    open func cancelPeripheralConnection(_ peripheral: CBPeripheral)

    //open func registerForConnectionEvents(options: [CBConnectionEventMatchingOption : Any]? = nil)

    """
   
)
extension CBCentralManager: PySwiftWrapper.PyClassProtocol {
    
   
    
    @PyInit
    convenience init(delegate: CBCentralManagerCallback, queue: String) throws {
        let q: dispatch_queue_t? = switch queue {
            case "main": .main
            case "global": .global()
            default: .init(label: queue)
            }
        self.init(delegate: delegate, queue: q, options: nil)
    }
    
    
    
    @PyMethod
    func scanForPeripherals(serviceUUIDs: [CBUUID]?) {
        print(serviceUUIDs ?? [])
        scanForPeripherals(withServices: serviceUUIDs)
    }
    @PyMethod
    func connect(peripheral: CBPeripheral) {
        connect(peripheral)
    }
    
    static var delegates: [AnyObject] = []
}


extension CBCentralManager: PySerializing.PySerializable {
    public var pyPointer: PyPointer { CBCentralManager.asPyPointer(self) }
}





@PyClass
public class PyCBCentralManager: NSObject {
    
    private var centralManager: CBCentralManager?
    
    @PyProperty
    var peripherals: [UUID:CBPeripheral] = [:]
    
    private var selectedPeripheral: CBPeripheral?
    //@Published var peripheralNames: [String] = []
    //@Published var isConnected: Bool = false
    
    private var addToPhotoStream: ((CBPeripheral, Int) -> Void)?
    
    @PyInit
    init(delegate: CBCentralManagerCallback, queue: Int?, hmm: String?) throws {
        super.init()
    }
    
    override init()
    {
        super.init()
        
        //self.centralManager = CBCentralManager(delegate: self, queue: .global())
    }
        
    @PyMethod
    public func connect(peripheral: CBPeripheral) {
        self.selectedPeripheral = peripheral
        self.centralManager?.connect(peripheral, options: nil)
        
    }
    
    @PyMethod
    public func disconnect(peripheral: CBPeripheral) {
        self.centralManager?.cancelPeripheralConnection(peripheral)
    }
    
    @PyMethod
    public func scan(services: [CBUUID]?) {
        centralManager?.scanForPeripherals(withServices: services)
        
    }
    
    @PyMethod
    public func stop_scan() {
        centralManager?.stopScan()
    }
}

extension PyCBCentralManager {
    
    public static let _shared: PyCBCentralManager = .init()
    
    @PyMethod
    static func shared() -> PyCBCentralManager {
        _shared
    }
}




extension PyCBCentralManager: CBCentralManagerDelegate {
	public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
	public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
//
//        if !peripherals.contains(peripheral) {
//            peripherals.append(peripheral)
////            print("didDiscover",RunLoop.current == RunLoop.main)
            DispatchQueue.main.async { [weak self] in
                //self.py_callback?.didDiscover(peripheral: peripheral, rssi: Int(truncating: RSSI))
            }
        
//        }
    }
    
	public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        //py_callback?.did_connect(peripheral: peripheral)
        //peripheral.discoverServices(nil)
    }
    
    
    
	public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        //py_callback?.remove_peripheral(peripheral: peripheral)
    }
    
}



extension PyCBCentralManager {
    

}
