//
//  PyCBPeripheralCallback.swift
//  PyCoreBluetooth
//
//  Created by CodeBuilder on 09/05/2025.
//

import Foundation
import CoreBluetooth

import PySwiftKit
import PySwiftObject
import PySerializing
import PyUnpack

import PySwiftWrapper


@PyClass
@PyContainer
final class PyCBPeripheralCallback: NSObject, PySerialize {
    
    
    @PyCall private func didOpen(_ peripheral: CBPeripheral, channel: CBL2CAPChannel?, error: Error?)
    
    @PyCall private func didModifyServices(_ peripheral: CBPeripheral, invalidatedServices: [CBService])
    
    @PyCall private func didDiscoverServices(_ peripheral: CBPeripheral, error: Error?)
    
    @PyCall private func didDiscoverDescriptors(_ peripheral: CBPeripheral,  characteristic: CBCharacteristic, error: Error?)
    
    @PyCall private func didDiscoverCharacteristics(_ peripheral: CBPeripheral,  service: CBService, error: Error?)
    
    @PyCall private func didUpdateNotificationState(_ peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Error?)
    
    @PyCall private func didDiscoverIncludedServices(_ peripheral: CBPeripheral, service: CBService, error: Error?)
    
    @PyCall private func didUpdateName(_ peripheral: CBPeripheral)
    
    @PyCall private func didReadRSSI(_ peripheral: CBPeripheral, RSSI: Int, error: Error?)
    
    @PyCall private func didWriteCharacteristic(_ peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Error?)
    
    @PyCall private func didWriteDescriptor(_ peripheral: CBPeripheral, descriptor: CBDescriptor, error: Error?)
    
    @PyCall private func didUpdateCharacteristic(_ peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Error?)
    
    @PyCall private func didUpdateDescriptor(_ peripheral: CBPeripheral, descriptor: CBDescriptor, error: Error?)
    
    @PyCall private func isReady(_ peripheral: CBPeripheral)
    
    //private var call_class: PyPointer
    
//    init(object: PyPointer) throws {
//        call_class = object
//        //_pyPointer = Self.asPyPointer(self)
//    }
  
    var pyPointer: PyPointer { Self.asPyPointer(self) }
    
    func test() {
       
    }
    
}

extension PyCBPeripheralCallback: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didOpen channel: CBL2CAPChannel?, error: Error?) {
        didOpen(peripheral, channel: channel, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        didModifyServices(peripheral, invalidatedServices: invalidatedServices)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        didDiscoverServices(peripheral, error: error)
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        didReadRSSI(peripheral, RSSI: RSSI.intValue, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        didWriteCharacteristic(peripheral, characteristic: characteristic, error: error)
    }
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        didWriteDescriptor(peripheral, descriptor: descriptor, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        //print("swift: didUpdateValueFor \(characteristic) -> \(characteristic.value ?? .init())")
        didUpdateCharacteristic(peripheral, characteristic: characteristic, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        didUpdateDescriptor(peripheral, descriptor: descriptor, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        didDiscoverDescriptors(peripheral, characteristic: characteristic, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        didDiscoverCharacteristics(peripheral, service: service, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        didUpdateNotificationState(peripheral, characteristic: characteristic, error: error)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverIncludedServicesFor service: CBService, error: Error?) {
        didDiscoverIncludedServices(peripheral, service: service, error: error)
    }
    
    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        isReady(peripheral)
    }
    
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        didUpdateName(peripheral)
    }
    
    
    
    
}
