import 'dart:io';

import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/wifi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:io' show Platform;

import 'package:wifi_iot/wifi_iot.dart';

class WifiDataBloc {
  dispose() {
    _cargandoController?.close();
    _listController?.close();

    _tokenController?.close();
  }

  String token;
  static final WifiDataBloc _singleton = new WifiDataBloc._internal();

  factory WifiDataBloc() {
    return _singleton;
  }

  WifiDataBloc._internal() {
    timer = Stream.periodic(Duration(seconds: 7), (int count) => count);
  }

  final _cargandoController = new BehaviorSubject<bool>();
  final _listController = new BehaviorSubject<DeviceList>();

  final _tokenController = new BehaviorSubject<String>();
  Stream<int> timer = new BehaviorSubject<int>();

  Stream<bool> get cargando => _cargandoController.stream;
  // Stream<int> get timer => _timerController;
  Stream<DeviceList> get listStream => _listController.stream;

  Stream<String> get tokenStream => _tokenController.stream;

  void getNetworkList() async {
    final list = await WifiScanConnect().scan();
    DeviceList dList = DeviceList.fromNetworkList(list);
    if (dList.list.length > 0) {
      print('filtered:${dList.list[0].devName}');
      _listController.add(dList);
    }
  }

  

  void deleteData() {
    _listController.add(null);
  }
}
