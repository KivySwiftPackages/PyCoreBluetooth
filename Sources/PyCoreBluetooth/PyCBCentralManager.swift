import CoreBluetooth

import PySwiftKit
import PySerializing

import PySwiftWrapper
import PySwiftObject
import PyUnpack

@PyClass
class TClass {
    
}

@PyClass
public class PyCBCentralManager: NSObject {
    private var centralManager: CBCentralManager?
    
    @PyProperty
    var peripherals: [CBPeripheral] = []
    
    private var selectedPeripheral: CBPeripheral?
    //@Published var peripheralNames: [String] = []
    //@Published var isConnected: Bool = false
    
    private var _isConnected: Bool = false
    
    @PyProperty
    var isConnected: Bool {
        get {
            _isConnected
        }
        set {
            _isConnected = newValue
            //self.py_callback?.connect_status(status: newValue)
        }
    }
    
    //var py_callback: PyCBCentralManagerPyCallback?
    
    
    override init()
    {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .global())
    }
    
    @PyMethod
    func getPeripherals() -> [CBPeripheral] {
        return self.peripherals
        //        return self.peripherals.filter { $0.name != nil }
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
            DispatchQueue.main.async {
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
