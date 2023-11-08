from swift_tools.swift_types import *

"import CoreBluetooth"


@wrapper
class CBUUID:
    uuidString = property(str, setter=False)
    data = property(bytes, setter=False)

    def __init__(self, string: str): ...

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

@wrapper(py_init=False)
class CBCharacteristic:

    value = property(bytes, setter=False)

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

# @wrapper(py_init=False)
# class CBCharacteristicWriteType: ...

@wrapper(py_init=False)
class CBMutableCharacteristic:

    value = property(bytes, setter=False)

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

@wrapper(py_init=False)
class CBDescriptor:
    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

@wrapper(py_init=False)
class CBL2CAPChannel: ...


CBService = NewType("CBService", object)
CBPeripheral = NewType("CBPeripheral", object)

@wrapper(target="PyCBPeripheralDelegate", new=True, debug_mode=False)
class PyCBPeripheralDelegate(NSObject):
    """
    # CBPeripheralDelegate
    ### A protocol that provides updates on the use of a peripheral's services.
    
    The delegate of a CBPeripheral object must adopt the CBPeripheralDelegate protocol. 
    The delegate uses this protocol’s methods to monitor the discovery, exploration, and interaction of a remote peripheral’s services and properties. 
    This protocol doesn’t have any required methods.
    """

    #delegate = property(Optional[object], protocol=True)

    def __init__(self, callback: object): ...

    class Callbacks:
        
        @func_options(call_target="peripheral", args_alias={"error": "didDiscoverServices"}, no_labels={"peripheral": True})
        def didDiscoverServices(self, peripheral: CBPeripheral, error: Optional[Error]):
            """
            ### CBPeripheralDelegate
            peripheral(_:didDiscoverServices:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didDiscoverServices error: Error?
            )
            ```
            """

        @func_options(call_target="peripheral", args_alias={"service": "didDiscoverIncludedServicesFor"}, no_labels={"peripheral": True})
        def didDiscoverIncludedServices(self, peripheral: CBPeripheral, service: CBService, error: Optional[Error]): """
            ### CBPeripheralDelegate
            peripheral(_:didDiscoverIncludedServicesFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didDiscoverIncludedServicesFor service: CBService,
                error: Error?
            )
            ```
            """
        
        @func_options(call_target="peripheral", args_alias={"service": "didDiscoverCharacteristicsFor"}, no_labels={"peripheral": True})
        def didDiscoverCharacteristics(self, peripheral: CBPeripheral, service: CBService, error: Optional[Error]): 
            """
            ### CBPeripheralDelegate
            peripheral(_:didDiscoverCharacteristicsFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didDiscoverCharacteristicsFor service: CBService,
                error: Error?
            )
            ```
            """

        @func_options(call_target="peripheral", args_alias={"characteristic": "didDiscoverDescriptorsFor"}, no_labels={"peripheral": True})
        def didDiscoverDescriptors(self, peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Optional[Error]): 
            """
            ### CBPeripheralDelegate
            peripheral(_:didDiscoverDescriptorsFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didDiscoverDescriptorsFor characteristic: CBCharacteristic,
                error: Error?
            )
            ```
            """


        @func_options(call_target="peripheral", args_alias={"characteristic": "didUpdateValueFor"}, no_labels={"peripheral": True})
        def didUpdateValueForCharacteristic(self, peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Optional[Error]): """
            ### CBPeripheralDelegate
            peripheral(_:didUpdateValueFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didUpdateValueFor characteristic: CBCharacteristic,
                error: Error?
            )
            ```
            """
        @func_options(call_target="peripheral", args_alias={"descriptor": "didUpdateValueFor"}, no_labels={"peripheral": True})
        def didUpdateValueForDescriptor(self, peripheral: CBPeripheral, descriptor: CBDescriptor, error: Optional[Error]): """
            ### CBPeripheralDelegate
            peripheral(_:didUpdateValueFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didUpdateValueFor descriptor: CBDescriptor,
                error: Error?
            )
            ```
            """

        @func_options(call_target="peripheral", args_alias={"characteristic": "didWriteValueFor"}, no_labels={"peripheral": True})
        def didWriteValueForCharacteristic(self, peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Optional[Error]): """
            ### CBPeripheralDelegate
            peripheral(_:didDiscoverCharacteristicsFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didDiscoverCharacteristicsFor service: CBService,
                error: Error?
            )
            ```
            """
        @func_options(call_target="peripheral", args_alias={"descriptor": "didWriteValueFor"}, no_labels={"peripheral": True})
        def didWriteValueForDescriptor(self, peripheral: CBPeripheral, descriptor: CBDescriptor, error: Optional[Error]): """
            ### CBPeripheralDelegate
            peripheral(_:didWriteValueFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didWriteValueFor descriptor: CBDescriptor,
                error: Error?
            )
            ```
            """
        
        
        @args_alias(peripheral="toSendWriteWithoutResponse")
        def peripheralIsReady(self, peripheral: CBPeripheral): 
            """
            ### CBPeripheralDelegate
            peripheralIsReady(toSendWriteWithoutResponse:)
            ```swift
            optional func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral)
            ```
            """

        @func_options(call_target="peripheral", args_alias={"characteristic": "didUpdateNotificationStateFor"}, no_labels={"peripheral": True})
        def didUpdateNotificationState(self, peripheral: CBPeripheral, characteristic: CBCharacteristic, error: Optional[Error]): ...

        @func_options(call_target="peripheral", args_alias={"RSSI": "didReadRSSI"}, no_labels={"peripheral": True})
        def didReadRSSI(self, peripheral: CBPeripheral, RSSI: int, error: Optional[Error]): ...

        @call_target("peripheral")
        def peripheralDidUpdateName(self, peripheral: CBPeripheral):
            """
            ### CBPeripheralDelegate
            peripheral(_:didWriteValueFor:error:)
            ```swift
            optional func peripheral(
                _ peripheral: CBPeripheral,
                didWriteValueFor characteristic: CBCharacteristic,
                error: Error?
            )
            ```
            """

        @func_options(call_target="peripheral", args_alias={"didModifyServices": "invalidatedServices"}, no_labels={"peripheral": True})
        def didModifyServices(self, peripheral: CBPeripheral, invalidatedServices: list[CBService] ): ...

        @func_options(call_target="peripheral", args_alias={"channel": "didOpen"}, no_labels={"peripheral": True})
        def didOpenChannel(self, peripheral: CBPeripheral, channel: Optional[CBL2CAPChannel], error: Optional[Error]): ...


@wrapper(py_init=False, debug_mode=False)
class CBPeripheral:
    """
    # CBPeripheral
    ### A remote peripheral device.
    ```swift
    class CBPeripheral : CBPeer
    ```
    The CBPeripheral class represents remote peripheral devices that your app discovers with a central manager (an instance of CBCentralManager). Peripherals use universally unique identifiers (UUIDs), represented by NSUUID objects, to identify themselves. Peripherals may contain one or more services or provide useful information about their connected signal strength.
    You use this class to discover, explore, and interact with the services available on a remote peripheral that supports Bluetooth low energy. A service encapsulates the way part of the device behaves. For example, one service of a heart rate monitor may be to expose heart rate data from a sensor. Services themselves contain of characteristics or included services (references to other services). Characteristics provide further details about a peripheral’s service. For example, the heart rate service may contain multiple characteristics. One characteristic could describe the intended body location of the device’s heart rate sensor, and another characteristic could transmit the heart rate measurement data. Finally, characteristics contain any number of descriptors that provide more information about the characteristic’s value, such as a human-readable description and a way to format the value.
    """

    name = property(Optional[str], setter=False)
    services = property(Optional[list[CBService]], setter=False)
    delegate = property(Optional[PyCBPeripheralDelegate], protocol=True)
    
    identifier = property(str, setter=False)
    _state = property(int, setter=False)

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...


    @no_labels
    @no_protocol
    def discoverServices(self, serviceUUIDs: Optional[list[CBUUID]]): ...

    @args_alias(service="for")
    @no_labels(includedServiceUUIDs=True)
    @no_protocol
    def discoverIncludedServices(self, includedServiceUUIDs: Optional[list[CBUUID]], service: CBService): ...

    @args_alias(service="for")
    @no_labels(characteristicUUIDs =True)
    @no_protocol
    def discoverCharacteristics(self, characteristicUUIDs: Optional[list[CBUUID]], service: CBService): ...

    # @no_protocol
    @func_options(call_target="writeValue")
    def writeCharacteristic(self, data: data, characteristic: CBCharacteristic, type: int = None): ...

    @no_protocol
    @func_options(call_target="writeValue", no_labels={"data": True}, args_alias={"descriptor": "for"})
    def writeDescriptor(self, data: data, descriptor: CBDescriptor): ...


    @no_protocol
    @func_options(no_labels={"enabled": True}, args_alias={"characteristic": "for"})
    def setNotifyValue(self, enabled: bool, characteristic: CBCharacteristic): ...

    @no_protocol
    @func_options(call_target="readValue", args_alias={"characteristic": "for"})
    def readCharacteristic(characteristic: CBCharacteristic): ...

    @no_protocol
    @func_options(call_target="readValue", args_alias={"descriptor": "for"})
    def readDescriptor(descriptor: CBDescriptor): ...

    def readRSSI(self): ...

@wrapper(py_init=False)
class CBService:

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

    peripheral = property(
        Optional[CBPeripheral], 
        setter=False
        )
    isPrimary = property(bool, setter=False)
    uuid = property(CBUUID, setter=False)

    includedServices = property(
        Optional[list[CBService]], 
        setter=False
        )
    characteristics = property(
        Optional[Array[CBCharacteristic]], 
        setter=False
        )


@wrapper(py_init=False)
class CBMutableService:

    def __repr__(self) -> str: ...
    def __str__(self) -> str: ...
    def __hash__(self) -> int: ...

@wrapper(target="PyCBCentralManager")
class CBCentralManager:

    class Callbacks:

        def didDiscover(self, peripheral: CBPeripheral, rssi: int): ...
        def remove_peripheral(self, peripheral: CBPeripheral): ...

        def connect_status(self, status: bool): ...

        #def test_connect(self, status: object): ...
        def did_connect(self, peripheral: CBPeripheral): ...

    def connect(self, peripheral: CBPeripheral): ...

    def disconnect(self, peripheral: CBPeripheral): ...


# just declaring that a normal python class will be in wrapper file also..
# real trick comes next
class PurePythonClass: 
    def some_function(self) -> int: ...
