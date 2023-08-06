import ble__handler
import asyncio
from flutter_channel.host import Host
from flutter_channel.exceptions import PythonChannelMethodException
from flutter_channel.channels import MethodChannel, JsonChannel

jsonChannel = JsonChannel("jsonChannel")
channel = MethodChannel('methodChannel')

if __name__ == '__main__':
    host = Host()
    host.bindChannel(channel)
    host.bindChannel(jsonChannel)
    ble__handler.setFlutterChannel(channel, jsonChannel)
    loop = asyncio.get_event_loop()
    loop.run_until_complete(ble__handler.run(loop))