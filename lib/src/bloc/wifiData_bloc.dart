import 'dart:io';

import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/wifi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:rxdart/rxdart.dart';
import 'dart:io' show Platform;
import 'package:wifi_connect/wifi_connect.dart';

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

  WifiDataBloc._internal() {}

  final _cargandoController = new BehaviorSubject<bool>();
  final _listController = new BehaviorSubject<DeviceList>();

  final _tokenController = new BehaviorSubject<String>();
  final timer = Stream.periodic(Duration(seconds: 10), (int count) => count);

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

  Future<String> connect(
      BuildContext context, String _ssid, String _password) async {
    final _connection =
        await WifiScanConnect().connect(context, _ssid, _password);
    return _connection;
  }

  void deleteData() {
    _listController.add(null);
  }
}
