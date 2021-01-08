import 'package:deviceapp/src/bloc/wifiData_bloc.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/wifi_provider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  WifiDataBloc scan = WifiDataBloc();
  @override
  Widget build(BuildContext context) {
    scan.getNetworkList();
    return SafeArea(
        child: Scaffold(
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
              color: Colors.white, borderRadius: BorderRadius.circular(100.00)),
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
          builder: (BuildContext context, AsyncSnapshot<DeviceList> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Text(snapshot.data.list.length.toString()),
              );
            } else {
              return Container(
                child: Text('no data'),
              );
            }
          },
        ),
      ]),
    )));
  }
}
