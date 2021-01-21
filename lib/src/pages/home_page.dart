import 'package:deviceapp/src/constants.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/provider/my-globals.dart';
//import 'package:deviceapp/src/pages/devices_page.dart';
import 'package:deviceapp/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:wifi_iot/wifi_iot.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      color: colorBackGround,
      child: SingleChildScrollView(
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
            child: wifiIcon(98.0, colorMedico),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Welcome',
            style: TextStyle(
                color: colorVN, fontSize: 40.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        child: Text("Scan wifi network to locate the devices",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ))),
                  ),
                  SizedBox(width: 10),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  //alignment: Alignment.center,
                  height: 50,
                  //width: 150,
                  child: submitButton('START', () {
                    Navigator.of(context).pushReplacementNamed('devicePage');
                  }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        "Make sure your phone is connected to the same Wifi Network to be configured on the devices.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ))),
              ),
            ],
          ),
        ]),
      ),
    )));
  }
}
