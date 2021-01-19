import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform;


class WifiScanConnect {
  /////
  String connectSuccess;
  var hidden = false;
  var ssidControl = TextEditingController(text: 'speaker');
  var passwordControl = TextEditingController(text: 'password');

  Future<List<WifiNetwork>> scan() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = List<WifiNetwork>();
    }

    return htResultNetwork;
  }

  Future<bool> isRegisteredWifiNetwork(String ssid) async {
    bool bIsRegistered;
    try {
      bIsRegistered = await WiFiForIoTPlugin.isRegisteredWifiNetwork(ssid);
    } on PlatformException {
      bIsRegistered = false;
    }
    return bIsRegistered;

    // setState(() {
    //   _htIsNetworkRegistered[ssid] = bIsRegistered;
    // });
  }

  
}
