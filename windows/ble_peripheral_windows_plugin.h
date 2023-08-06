#ifndef FLUTTER_PLUGIN_BLE_PERIPHERAL_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_BLE_PERIPHERAL_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace ble_peripheral_windows {

class BlePeripheralWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BlePeripheralWindowsPlugin();

  virtual ~BlePeripheralWindowsPlugin();

  // Disallow copy and assign.
  BlePeripheralWindowsPlugin(const BlePeripheralWindowsPlugin&) = delete;
  BlePeripheralWindowsPlugin& operator=(const BlePeripheralWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace ble_peripheral_windows

#endif  // FLUTTER_PLUGIN_BLE_PERIPHERAL_WINDOWS_PLUGIN_H_
