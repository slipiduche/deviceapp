import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform;
import 'package:wifi_connect/wifi_connect.dart';

class WifiDevice {
  WifiDevice(
      {this.ssid,
      this.bssid,
      this.capabilities,
      this.frequency,
      this.level,
      this.timestamp,
      this.password,
      this.devName,
      this.devType,
      this.devChipId,
      this.devStatus});
  String ssid;
  String bssid;
  String capabilities;
  int frequency;
  int level;
  int timestamp;
  String password;
  String devName;
  String devType;
  String devStatus;
  String devChipId;

  factory WifiDevice.fromMap(WifiNetwork network) => WifiDevice(
        ssid: network.ssid,
        bssid: network.bssid,
        capabilities: network.capabilities,
        frequency: network.frequency,
        level: network.level,
        timestamp: network.timestamp,
        password: network.password,
        devName: network.ssid.substring(15),
        devType: network.ssid.substring(2, 3),
        devChipId: network.ssid.substring(3, 15),
        devStatus: network.ssid.substring(1, 2),
      );
}

class DeviceList {
  List<WifiDevice> list = new List();
  DeviceList();
  DeviceList.fromNetworkList(List<WifiNetwork> networkList) {
    if (networkList == null) return;
    networkList.forEach((element) {
      print(element.ssid);
      if (element.ssid.startsWith('&') &&
          (element.ssid.substring(2, 3) == 'G' ||
              element.ssid.substring(2, 3) == 'R' ||
              element.ssid.substring(2, 3) == 'S')) {
                print('filtering:${element.ssid.substring(15)}');
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
        list.add(WifiDevice.fromMap(element));
      }
    });
  }
}
