import 'package:deviceapp/src/icons/icons.dart';

import 'package:deviceapp/src/provider/my-globals.dart';
import 'package:deviceapp/src/widgets/widgets.dart';
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
    if (globalType == 'S') title = "Speaker";
    if (globalType =='R') title = "Reader";
    if (globalType == 'G') title = "Register";

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.00)),
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
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
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
                                  border: Border.all(
                                      width: 1, color: Colors.black26),
                                ),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      left: 08.0, right: 08.0, top:10.0),
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                hintText: "Type your WiFi name:$globalSsid",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                                  ),
                                )),
                          ])),
                    ],
                  ),
                ),
                SizedBox(height: 10.00),
                Container(
                    height: 100,
                    width: 360,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('Password',
                            style: TextStyle(
                                color: colorVN,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w300,
                                )
                                ),
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
                            margin:
                                const EdgeInsets.only(left: 08.0, right: 08.0, top: 10.0),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                hintText: "Type your WiFi password:$globalPassword",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )),
                    ])),
                SizedBox(height: 10.00),
                Container(
                    height: 100,
                    width: 360,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text('Device Name',
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
                            margin:
                                const EdgeInsets.only(left: 08.0, right: 08.0, top:10),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w300),
                                  
                              decoration: InputDecoration(
                                hintText: "Name your device Ex: $globalDevName",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              
                            ),
                          )),
                     
                    ])),
                SizedBox(height: 20.0),
                Container(
                  width: 160,
                  height: 50,
                  child: submitButton("Done", () {}),
                ),
              ],
            ),
          )),
        ]),
      ),
    ));
  }
}
