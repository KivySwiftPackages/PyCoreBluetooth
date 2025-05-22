from typing import Optional, Protocol, Callable


class PyCBCentralManager():
    peripherals: list["CBPeripheral"]
    isConnected: bool

    def getPeripherals(self) -> list["CBPeripheral"]: 
        pass

    def connect(self, peripheral: "CBPeripheral"): 
        pass

    def disconnect(self, peripheral: "CBPeripheral"): 
        pass


class PyCBPeripheralCallback(Protocol):

    def didOpen(
        self,
        peripheral: "CBPeripheral",
        channel: "CBL2CAPChannel" | None,
        error: str | None
    ): 
        pass

    def didModifyServices(self, peripheral: "CBPeripheral", invalidatedServices: list["CBService"]): 
        pass

    def didDiscoverServices(self, peripheral: "CBPeripheral", error: str | None): 
        pass

    def didDiscoverDescriptors(
        self,
        peripheral: "CBPeripheral",
        characteristic: "CBCharacteristic",
        error: str | None
    ): 
        pass

    def didDiscoverCharacteristics(
        self,
        peripheral: "CBPeripheral",
        service: "CBService",
        error: str | None
    ): 
        pass

    def didUpdateNotificationState(
        self,
        peripheral: "CBPeripheral",
        characteristic: "CBCharacteristic",
        error: str | None
    ): 
        pass

    def didDiscoverIncludedServices(
        self,
        peripheral: "CBPeripheral",
        service: "CBService",
        error: str | None
    ): 
        pass

    def didUpdateName(self, peripheral: "CBPeripheral"): 
        pass

    def didReadRSSI(self, peripheral: "CBPeripheral", RSSI: int, error: str | None): 
        pass

    def didWriteCharacteristic(
        self,
        peripheral: "CBPeripheral",
        characteristic: "CBCharacteristic",
        error: str | None
    ): 
        pass

    def didWriteDescriptor(
        self,
        peripheral: "CBPeripheral",
        descriptor: "CBDescriptor",
        error: str | None
    ): 
        pass

    def didUpdateCharacteristic(
        self,
        peripheral: "CBPeripheral",
        characteristic: "CBCharacteristic",
        error: str | None
    ): 
        pass

    def didUpdateDescriptor(
        self,
        peripheral: "CBPeripheral",
        descriptor: "CBDescriptor",
        error: str | None
    ): 
        pass

    def isReady(self, peripheral: "CBPeripheral"): 
        pass


class CBUUID():

    @staticmethod
    def create(string: str) -> "Self": 
        pass


class CBPeripheral():

    def get_services(self) -> list["CBService"] | None: 
        pass

    def set_delegate(self, delegate: "PyCBPeripheralCallback"): 
        pass
    identifier: "UUID"
    name: str | None
    state: "CBPeripheralState"
    services: list["CBService"] | None
    canSendWriteWithoutResponse: bool
    ancsAuthorized: bool

    def readRSSI(self): 
        pass

    def discoverServices(self, serviceUUIDs: list["CBUUID"] | None): 
        pass

    def discoverIncludedServices(
        self,
        includedServiceUUIDs: list["CBUUID"] | None,
        service: "CBService"
    ): 
        pass

    def discoverCharacteristics(
        self,
        characteristicUUIDs: list["CBUUID"] | None,
        service: "CBService"
    ): 
        pass

    def readValue(self, characteristic: "CBCharacteristic"): 
        pass

    def maximumWriteValueLength(self, type: "CBCharacteristicWriteType") -> int: 
        pass

    def writeValue(
        self,
        data: bytes,
        characteristic: "CBCharacteristic",
        type: "CBCharacteristicWriteType"
    ): 
        pass

    def setNotifyValue(self, enabled: bool, characteristic: "CBCharacteristic"): 
        pass

    def discoverDescriptors(self, characteristic: "CBCharacteristic"): 
        pass

    def readValue(self, descriptor: "CBDescriptor"): 
        pass

    def writeValue(self, data: bytes, descriptor: "CBDescriptor"): 
        pass

    def openL2CAPChannel(self, PSM: "CBL2CAPPSM"): 
        pass


class CBCharacteristic():
    uuid: "CBUUID"
    service: "CBService" | None
    value: bytes | None
    descriptors: list["CBDescriptor"] | None
    isBroadcasted: bool
    isNotifying: bool


class CBService():

    @staticmethod
    def create2(uuid: str, primary: bool) -> "CBService": 
        pass
    peripheral: "CBPeripheral" | None
    isPrimary: bool
    includedServices: list["CBService"] | None
    characteristics: list["CBCharacteristic"] | None


class CBDescriptor():
    characteristic: "CBCharacteristic" | None


class CBL2CAPChannel():
    psm: "CBL2CAPPSM"
