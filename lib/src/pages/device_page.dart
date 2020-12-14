import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/provider/global_classes.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

final deviceData =
    new GlobalVariables(deviceType: 3, chipID: "chipID", status: 1);
String title;

class DevicePage1 extends StatefulWidget {
  DevicePage1({Key key}) : super(key: key);

  @override
  _DevicePageState1 createState() => _DevicePageState1();
}

class _DevicePageState1 extends State<DevicePage1> {
  @override
  Widget build(BuildContext context) {
    if (deviceData.deviceType == 1) title = "Speaker";
    if (deviceData.deviceType == 2) title = "Reader";
    if (deviceData.deviceType == 3) title = "Register";

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
          
          child: selectIcon(98.0, colorMedico,deviceData.deviceType),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
              color: colorVN, fontSize: 40.0, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text('hola',
            style: TextStyle(
                color: colorVN, fontSize: 25.0, fontWeight: FontWeight.w300)),
        SizedBox(
          height: 10.0,
        ),
      ]),
      //child:Colum()
    )));
  }
}
