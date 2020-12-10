import 'package:deviceapp/src/icons/icons.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      color: colorBackGround,
      child: Column(
        children:[Container(
          height:10.0,
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
          ]
      ),
      //child:Colum()
    )));
  }
}