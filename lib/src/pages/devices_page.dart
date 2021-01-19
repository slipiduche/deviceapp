import 'package:deviceapp/src/bloc/wifiData_bloc.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/my-globals.dart';
import 'package:deviceapp/src/provider/wifi_provider.dart';
import 'package:deviceapp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

class _DevicePageState extends State<DevicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _passwordTyped;
  WifiDataBloc scan = WifiDataBloc();
  ScrollController _scrollController = new ScrollController();
  bool _closeError = false;
  bool _connectDialog = false;
  @override
  void initState() {
    errorClosed = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
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
          StreamBuilder(
              stream: scan.timer,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  scan.deleteData();
                  timeout2++;
                  firstTime = true;
                  if (!connecting) {
                    if ((timeout2 > 1) && (errorClosed) && _timeout) {
                      // Navigator.pop(context);
                      //errorClosed = false;
                      //_timeout = false;
                      if (timeout2 > 3) {
                        timeout2 = 0;
                      }
                      timeout2 = 0;

                      if (changing) {
                        scan.deleteData();
                      }
                      scan.getNetworkList();
                    }
                  } else {}
                }
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => onAfterBuild(context));
                return SizedBox(
                  height: 10.0,
                );
              }),
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: scan.listStream,
                builder:
                    (BuildContext context, AsyncSnapshot<DeviceList> snapshot) {
                  // WidgetsBinding.instance
                  //     .addPostFrameCallback((_) => onAfterBuild(context));
                  print('redibujando');
                  if (snapshot.hasData) {
                    if (!errorClosed) {
                      _closeError = true;
                    }
                    _timeout = false;
                    return Container(
                      child: RefreshIndicator(
                        displacement: 60.0,
                        color: colorMedico,
                        onRefresh: () async {
                          if (!connecting) {
                            if (changing) {
                              scan.deleteData();
                            }
                            scan.getNetworkList();
                          }
                        },
                        child: makeDeviceList(
                            _scrollController, snapshot.data, context,
                            (network, _tapcontext) {
                          print(network.ssid);
                          print(network.devType);
                          showConnect(context, network);
                        }),
                      ),
                    );
                  } else {
                    WifiDataBloc().getNetworkList();
                    _timeout = true;
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
            ),
          ),
        ]),
      ),
    ));
  }

  void showConnect(BuildContext _context, WifiDevice _network) {
    _connectDialog = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        child: WillPopScope(
          onWillPop: () {
            _connectDialog = false;
            Navigator.of(_context).pop();
          },
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
                      Expanded(
                        child:
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
                                  Text(
                                    _network.devName,
                                    style: TextStyle(fontSize: 25.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              _passwordInput(
                                  context, 'Password', _network.password,
                                  (String password) {
                                _passwordTyped = password;
                                print('Password:$password');
                              }),
                              SizedBox(
                                height: 5.0,
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      submitButton('Connect', () async {
                        _connectDialog = false;
                        connecting = true;
                        print('presiono conectar');
                        final wifi = await WiFiForIoTPlugin.isEnabled();
                        if (!wifi) {
                          WiFiForIoTPlugin.setEnabled(true);
                          print('encender wifi');
                        }
                        bool _connected = await WiFiForIoTPlugin.isConnected();
                        if (_connected) {
                          print('desconectando');
                          final _disconnect =
                              await WiFiForIoTPlugin.disconnect();
                          _connected = false;
                        }
                        if (_connected == false) {
                          dynamic _connection = await WiFiForIoTPlugin.connect(
                              _network.ssid,
                              password: _passwordTyped,
                              security: NetworkSecurity.WPA,
                              withInternet: false);
                          _connection = await WiFiForIoTPlugin.connect(
                              _network.ssid,
                              password: _passwordTyped,
                              security: NetworkSecurity.WPA,
                              withInternet: true);

                          if (_connection) {
                            print('conectando');
                            _connected = await WiFiForIoTPlugin.isConnected();
                          }
                        } //
                        Navigator.of(context).pop();
                        updating(context, 'Connecting');
                        await Future.delayed(Duration(seconds: 5));
                        while ((_connected == false) && (timeout2 < 2)) {
                          _connected = await WiFiForIoTPlugin.isConnected();
                        }
                        timeout2 = 0;

                        if (_connected) {
                          print('se conectó'); //
                          await WiFiForIoTPlugin.forceWifiUsage(true);
                          print('forzo wifi');
                          await Future.delayed(Duration(seconds: 1));
                          final response =
                              await get('http://192.168.4.1:80/getData');
                          print(response.body);
                          final devParams = convert.jsonDecode(response.body);
                          if (devParams['NAME'] == null ||
                              devParams['NAME'] == '') {
                            errorPopUp(context, 'Device not responding error.',
                                (context) {
                              connecting = false;
                              changing = false;
                              Navigator.of(errorContext).pop();
                            });
                          } else {
                            globalType = _network.devType;
                            globalDevName = devParams['NAME'];
                            globalSsid = devParams['SSID'];
                            globalPassword = devParams['PASSWORD'];
                            globalChipID = _network.devChipId;
                            connecting = false;
                            Navigator.of(updatingContext).pop();

                            Navigator.of(context).pushNamed('devicePage1');
                          }
                        } else {
                          Navigator.of(updatingContext).pop();
                          errorPopUp(_scaffoldKey.currentContext,
                              'Device not connected', (context) {
                            connecting = false;
                            changing = false;
                            //Navigator.of(errorContext).pop();
                          });
                        }
                      }),
                    ],
                  ),
                ],
              ),
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
    bool enabled = false;
    enabled = await WiFiForIoTPlugin.isEnabled();
    // while (!enabled) {
    //   WiFiForIoTPlugin.setEnabled(true);
    //   enabled = await WiFiForIoTPlugin.isEnabled();
    //   print('habilitando wifi');
    // }
    // dynamic _sinConexion = Future.delayed(Duration(seconds: 7), () {
    if (_closeError&&!_connectDialog) {
      errorClosed = true;
      _closeError = false;
      Navigator.of(errorContext).pop();
    }
    if (_timeout && errorClosed && firstTime&&!_connectDialog) {
      final _error = true;
      // Navigator.pop(context);
      //_timeout = false;
      errorClosed = false;
      errorPopUp(context,
          'Devices unavailable, make sure wifi and location services are active and try again.',
          (context) {
        errorClosed = true;
        scan.getNetworkList();
        //Navigator.of(context).pop();
      });
      // showDialog(
      //     context: context,
      //     child: AlertDialog(
      //       elevation: 5.0,
      //       title: Center(child: Text('Error')),
      //       content: Container(
      //         child: Text(
      //           "Devices unavailable,make sure wifi and location services are active and try again.",
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //       actions: [
      //         submitButton('ok', () {
      //           errorClosed = true;
      //           scan.getNetworkList();
      //           Navigator.of(context).pop();
      //         })
      //       ],
      //     ));
      print(
          'no se pudo establecer conexión con el servidor intentar de nuevo?');

      return _error;
    } else {
      print('Sigue...');
      final _error = false;
      return _error;
    }

    // if (_ruta==0) {
    //    setState(() {

    //    });

    //  }
  }
}
