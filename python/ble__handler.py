import logging
import asyncio
from typing import Any
from bless import (  # type: ignore
        BlessServer,
        BlessGATTCharacteristic,
        GATTCharacteristicProperties,
        GATTAttributePermissions
    )
from flutter_channel.host import Host
from flutter_channel.exceptions import PythonChannelMethodException
from flutter_channel.channels import MethodChannel, JsonChannel

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(name=__name__)

server= None
jsonChannel = None

def read_request(characteristic: BlessGATTCharacteristic,**kwargs) -> bytearray:
    logger.debug(f"Reading {characteristic.value}")
    return characteristic.value


def write_request(characteristic: BlessGATTCharacteristic,value: Any,**kwargs):
    characteristic.value = value
    logger.debug(f"Char value set to {characteristic.value}")


async def startAdvertising():
    await server.start()

async def stopAdvertising():
    await server.stop()

async def addServices():
    my_service_uuid = "A07498CA-AD5B-474E-940D-16F1FBE7E8CD"
    my_char_uuid = "51FF12BB-3ED8-46E5-B4F9-D64E2FEC021B"

    await server.add_new_service(my_service_uuid)
    char_flags = (
            GATTCharacteristicProperties.read |
            GATTCharacteristicProperties.write |
            GATTCharacteristicProperties.indicate
            )
    permissions = (
            GATTAttributePermissions.readable |
            GATTAttributePermissions.writeable
            )
    await server.add_new_characteristic(
            my_service_uuid,
            my_char_uuid,
            char_flags,
            None,
            permissions)
    logger.debug(server.get_characteristic(my_char_uuid))
    

def methodChannelHandler(msg, reply):
    if msg.method == 'startAdvertising':
        asyncio.run(startAdvertising())
        reply.reply(None)
    elif msg.method == 'stopAdvertising':
        asyncio.run(stopAdvertising())
    elif msg.method == 'addServices':
        asyncio.run(addServices())        
    else:
        raise PythonChannelMethodException(
            404, 'method not found', 'method not found')


# Initialize the server
async def run(loop):
    global server
    my_service_name = "Test Service"
    server = BlessServer(name=my_service_name, loop=loop)
    server.read_request_func = read_request
    server.write_request_func = write_request

def setFlutterChannel(methodChannel,jChannel):
    global jsonChannel
    jsonChannel = jChannel
    methodChannel.setHandler(methodChannelHandler)