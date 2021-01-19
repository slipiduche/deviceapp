import 'package:deviceapp/src/pages/home_page.dart';
import 'package:deviceapp/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'homePage',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('ruta llamada ${settings.name}');
        //Navigator.pop(context);
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}
