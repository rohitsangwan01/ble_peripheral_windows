#include "include/ble_peripheral_windows/ble_peripheral_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "ble_peripheral_windows_plugin.h"

void BlePeripheralWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ble_peripheral_windows::BlePeripheralWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
