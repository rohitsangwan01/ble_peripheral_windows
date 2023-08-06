//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <ble_peripheral_windows/ble_peripheral_windows_plugin_c_api.h>
#include <python_channel/python_channel_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BlePeripheralWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BlePeripheralWindowsPluginCApi"));
  PythonChannelPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PythonChannelPluginCApi"));
}
