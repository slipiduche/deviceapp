import 'package:deviceapp/src/icons/icons.dart';

import 'package:deviceapp/src/provider/my-globals.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

/*final deviceData =
    new GlobalVariables(deviceType: 3, chipID: "chipID", status: 1);*/
String title;

class DevicePage1 extends StatefulWidget {
  DevicePage1({Key key}) : super(key: key);

  @override
  _DevicePageState1 createState() => _DevicePageState1();
}

class _DevicePageState1 extends State<DevicePage1> {
  @override
  Widget build(BuildContext context) {
    if (globalType == 1) title = "Speaker";
    if (globalType == 2) title = "Reader";
    if (globalType == 3) title = "Register";

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
          child: selectIcon(98.0, colorMedico, globalType),
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
        Text('Wifi Network',
            style: TextStyle(
                color: colorVN, fontSize: 25.0, fontWeight: FontWeight.w300)),
        SizedBox(
          height: 10.0,
        ),
        Container(
            height: 100,
            width: 360,
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text('Name',
                    style: TextStyle(
                        color: colorVN,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 10.00,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(08.00),
                    border: Border.all(width: 1, color: Colors.black26),
                  ),
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 08.0, right: 08.0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300),
                      decoration: null,
                    ),
                  )),
            ])),
      ]),
      //child:Colum()
    )));
  }
}
