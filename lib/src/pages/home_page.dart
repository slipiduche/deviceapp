import 'package:deviceapp/src/constants.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
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
          height: 10.0,
        ),
        Text('help',
            style: TextStyle(
                color: colorVN, fontSize: 30.0, fontWeight: FontWeight.w300)),
        SizedBox(
          height: 20.0,
        ),
        Container(
            height: 40.0,
            width: 350.0,
            decoration: BoxDecoration(
              color: colorMedico1,
            ),
            child: Text('  Configured',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300))),
        Container(
          height: 250.0,
          width: 350.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 0.0),
              child: Text(
                "A configured device will have a green dot indicating that are connected to the network",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.00,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: .0,
            ),
            Container(
              height: 80.0,
              width: 350.0,
              //alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 10.0, right: 0.0),
              child: Row(
                children: [
                  Container(
                    height: 70.0,
                    width: 70.0,
                    //alignment: Alignment.centerLeft,
                    child: homeIcon(70, colorMedico1),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          //alignment: Alignment.topLeft,
                          child: Text(
                            "Speaker1",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 25.00),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 20,
                          child: Text(
                            "type: Speaker",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 15.00),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 20,
                          child: Text(
                            "Chip ID: 95ds3546587",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 15.00),
                          ),
                        ),
                      ], 
                    ),
                  ),
                SizedBox(
                  width: 30.0,
                ),
                Container(
                          width:60.0,
                          height:60.0,
                          decoration: BoxDecoration(
                            gradient: gradiente,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                ],
              ),
              //child: homeIcon(70,colorMedico1),
            ),
          ]),
        ),
        Container(),
      ]),
    )));
  }
}