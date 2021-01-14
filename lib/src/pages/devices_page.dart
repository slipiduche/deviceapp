import 'dart:convert';

import 'package:deviceapp/src/bloc/wifiData_bloc.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/wifi_provider.dart';
import 'package:deviceapp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:wifi_connect/wifi_connect.dart';
import 'package:wifi_iot/wifi_iot.dart';
//import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'dart:io';

import '../constants.dart';

bool _timeout = false;

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
    with WifiScannerMixin<DevicePage> {
  String _passwordTyped;
  WifiDataBloc scan = WifiDataBloc();
  @override
  void initState() {
    super.initState();
    startWifiScanner();
  }

  @override
  Widget build(BuildContext context) {
    scan.getNetworkList();
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        color: colorBackGround,
        child: Column(children: [
          Container(
              height: 10.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: gradiente,
              )),
          SizedBox(height: 26.0),
          Container(
            height: 123,
            width: 123,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.00)),
            child: devicesIcon(98.0, colorMedico),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Devices',
            style: TextStyle(
                color: colorVN, fontSize: 40.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Select a device to configure',
              style: TextStyle(
                  color: colorVN, fontSize: 25.0, fontWeight: FontWeight.w300)),
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: scan.listStream,
            builder:
                (BuildContext context, AsyncSnapshot<DeviceList> snapshot) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => onAfterBuild(context));
              print('redibujando');
              if (snapshot.hasData) {
                return Container(
                  child: makeDeviceList(snapshot.data, context,
                      (network, _tapcontext) {
                    print(network.ssid);
                    print(network.devType);
                    showConnect(context, network);
                  }),
                );
              } else {
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(colorMedico),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ]),
      ),
    )));
  }

  void showConnect(BuildContext _context, WifiDevice _network) {
    showDialog(
        context: context,
        child: AlertDialog(
          elevation: 5.0,
          title: Center(child: Text('Connect to device')),
          content: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: MediaQuery.of(context).size.height - 500,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,

                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50.0,
                              ),
                              Text(
                                _network.devName,
                                style: TextStyle(fontSize: 25.0),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                            ],
                          ),
                          _passwordInput(context, 'Password', _network.password,
                              (String password) {
                            _passwordTyped = password;
                            print('Password:$password');
                          }),
                          SizedBox(
                            height: 5.0,
                          ),
                        ]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    submitButton('Connect', () async {
                      // print(_network.devName);
                      // final _connection = await WifiDataBloc()
                      //     .connect(context, _network.ssid, _passwordTyped);
                      final _connection = await WiFiForIoTPlugin.connect(
                          _network.ssid,
                          password: _passwordTyped,
                          security: NetworkSecurity.WPA,
                          withInternet: true
                          );
                      print('presiono conectar');
                      print('status:$_connection');
                      if (_connection) {
                        print('se conectó');
                        await Future.delayed(Duration(seconds: 5));
                        final response = await get('http://192.168.4.1:80/getData');
                        print(response.body);
                        // HttpClient client = HttpClient();
                        // client
                        //     .getUrl(Uri.parse('http://192.168.4.1/getData'))
                        //     .then(
                        //   (req) {
                        //     return req.close();
                        //   },
                        // ).then(
                        //   (response) {
                        //     response.transform(utf8.decoder).listen(print);
                        //   },
                        // );
                        Navigator.of(context).pop();
                        var url = 'http://192.168.4.1/getData';

                        // Await the http get response, then decode the json-formatted response.
                        // var response = await http.get(url);
                        // print(response);
                        // if (response.statusCode == 200) {
                        //   var jsonResponse = convert.jsonDecode(response.body);
                        //   var itemCount = jsonResponse['totalItems'];
                        //   print('Number of books about http: $itemCount.');
                        // } else {
                        //   print(
                        //       'Request failed with status: ${response.statusCode}.');
                        // }
                      }
                      // Navigator.of(dialogContext).pop();
                      // //updating(context, 'updating');
                      // print(upSong.toJson());
                      // final resp = await ServerDataBloc().updateSong(upSong);
                      // if (resp) {
                      //   print('updated');
                      //   Navigator.of(_updatingContext).pop();
                      //   updated(dialogContext, 'Updated');
                      // } else {
                      //   print('error');
                      //   Navigator.of(_updatingContext).pop();
                      //   errorPopUp(dialogContext, 'Error');
                      // }
                    }),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _passwordInput(BuildContext _context, String hintText,
      String textValue, Function update) {
    final _textValue = new TextEditingController(text: textValue);
    if (hintText == 'MAC') {
      //_macNueva = textValue;
    } else {
      //_nombreNuevo = textValue;
    }

    return Container(
        width: MediaQuery.of(_context).size.width - 150,
        //padding: EdgeInsets.all(25.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorBordeBotton,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: TextField(
          //autofocus: true,
          //textCapitalization: TextCapitalization.sentences,
          controller: _textValue,
          scrollPadding: EdgeInsets.all(5.0),

          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
          onChanged: (valor) {
            // _opcionSeleccionada = null;
            // prefs.dispositivoSeleccionado = null;
            if (hintText == 'Name') {
              update(valor);
            } else {
              update(valor);
              // _nombreNuevo = valor;
            }
            //setState(() {});
          },
        ));
  }

  onAfterBuild(BuildContext context) async {
    dynamic _sinConexion = await Future.delayed(Duration(seconds: 7), () {
      if (_timeout) {
        final _error = true;
        // Navigator.pop(context);

        showDialog(
            context: context,
            child: AlertDialog(
              elevation: 5.0,
              title: Center(child: Text('Error')),
              content: Container(
                child: Text(
                  "Devices unavailable, try again?.",
                  textAlign: TextAlign.center,
                ),
              ),
            ));
        print(
            'no se pudo establecer conexión con el servidor intentar de nuevo?');

        return _error;
      } else {
        print('Sigue...');
        final _error = false;
        return _error;
      }
    });
    // if (_ruta==0) {
    //    setState(() {

    //    });

    //  }
  }
}
