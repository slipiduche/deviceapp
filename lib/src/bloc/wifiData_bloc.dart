import 'dart:io';

import 'package:flutter/services.dart';

import 'package:rxdart/rxdart.dart';

class WifiDataBloc {
  dispose() {
    _cargandoController?.close();
    _tagController?.close();

    _tokenController?.close();
  }

  String token;
  static final WifiDataBloc _singleton = new WifiDataBloc._internal();

  factory WifiDataBloc() {
    return _singleton;
  }

  WifiDataBloc._internal() {}

  final _cargandoController = new BehaviorSubject<bool>();
  final _tagController = new BehaviorSubject<String>();

  final _tokenController = new BehaviorSubject<String>();

  Stream<bool> get cargando => _cargandoController.stream;
  Stream<String> get tagStream => _tagController.stream;

  Stream<String> get tokenStream => _tokenController.stream;

  // Future<bool> updateSong(song) async {
  //   if (token == '' || token == null) {
  //     login();
  //     await Future.delayed(Duration(seconds: 1));

  //     if (token != '' && token != null) {
  //       final postData =
  //           '{"TOKEN":"$token","TARGET":"MUSIC","FIELD1":"${song.songName}","FIELD2":"${song.artist}","FIELD3":"${song.flName}","FIELD4":"${song.id}"}';
  //       final resp = _serverDataProvider.publishData(postData, 'APP/UPDATE');
  //       await Future.delayed(Duration(seconds: 1));

  //       return resp;
  //     }
  //   } else {
  //     final postData =
  //         '{"TOKEN":"$token","TARGET":"MUSIC","FIELD1":"${song.songName}","FIELD2":"${song.artist}","FIELD3":"${song.flName}","FIELD4":"${song.id}"}';
  //     final resp = _serverDataProvider.publishData(postData, 'APP/UPDATE');
  //     await Future.delayed(Duration(seconds: 1));

  //     return resp;
  //   }
  //   return false;
  // }

  // void bindSong(Music song) {
  //   _songController.add(song);
  // }

  void deleteData() {
    _tagController.add(null);
  }
}
