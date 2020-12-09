import 'package:deviceapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    //'iniciandoPage': (BuildContext context) => IniciandoPage(),
    
    'homePage': (BuildContext context) => HomePage(),

  };
}