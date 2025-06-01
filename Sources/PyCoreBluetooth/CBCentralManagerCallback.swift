import CoreBluetooth

import PySwiftKit
import PySerializing
import PySwiftWrapper
import PySwiftObject
import PyUnpack

@PyClass
@PyContainer
public final class CBCentralManagerCallback: NSObject {
    
    //@PyCall
//    func didConnect(_ central: CBCentralManager, peripheral: CBPeripheral)
    
    @PyCall func didUpdateState(_ central: CBCentralManager)
    
    @PyCall func didDiscover(peripheral: CBPeripheral, rssi RSSI: Int)
    
    @PyCall func didConnect(peripheral: CBPeripheral)
    
    @PyCall func didDisconnectPeripheral(peripheral: CBPeripheral, error: (any Error)?)
    
}


extension CBCentralManagerCallback: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        didUpdateState(central)
    }
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let rssi = Int(truncating: RSSI)
        DispatchQueue.main.async { [weak self] in
            self?.didDiscover(peripheral: peripheral, rssi: rssi)
        }
    }
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        didConnect(peripheral: peripheral)
    }
    
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: (any Error)?) {
        didDisconnectPeripheral( peripheral: peripheral, error: error)
    }
}


