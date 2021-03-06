import 'package:flutter/material.dart';

final String serverUri = "192.168.1.103";
final int mqttPort = 3000;
final String uploadPort = '8081';
final String topicName = "server/#";
// final String topicIn = "SDR/c4d7ba3a7d80/out";
// final String topicOut = "SDR/c4d7ba3a7d80/in";

final Color colorResaltadoBoton = Color.fromRGBO(234, 234, 234, 1.0);
final Color colorOrbittas = Color.fromRGBO(0, 122, 146, 1.0);
final Color colorVN = Color.fromRGBO(4, 61, 57, 1.0);
final Color colorBackGround = Color.fromRGBO(251, 251, 251, 1.0);
final Color colorMedico = Color.fromRGBO(67, 205, 197, 1.0);
final Color colorMedico1 = Color.fromRGBO(51, 232, 221, 1.0);
final Color colorMedico2 = Color.fromRGBO(49, 188, 180, 1.0);
final Color colorMedico3 = Color.fromRGBO(13, 148, 140, 1.0);
final Color colorBordeBotton = Color.fromRGBO(196, 196, 196, 1.0);
final Color colorShadow = Color.fromRGBO(0, 0, 0, 0.25);
final Color colorBordeSearch = Color.fromRGBO(229, 229, 229, 1.0);
final Color colorLetraSearch = Color.fromRGBO(142, 142, 142, 1.0);
final Color gris = Color.fromRGBO(229, 229, 229, 1.0);
final Color gris1 = Color.fromRGBO(142, 142, 142, 1.0);
final Color gris2 = Color.fromRGBO(197, 197, 197, 1.0);
final Color gris3 = Color.fromRGBO(169, 169, 169, 1.0);
final BoxShadow boxShadow1 = BoxShadow(
    color: colorShadow,
    blurRadius: 4.0,
    spreadRadius: 0.0,
    offset: Offset(0, 4.0));
final LinearGradient gradiente = LinearGradient(
    colors: [colorMedico3, colorMedico2, colorMedico1, colorMedico],
    stops: [0.0, 0.651, 0.9999, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter);
final LinearGradient gradiente1 = LinearGradient(
  colors: [gris1, gris3, gris2, gris],
  stops: [0.0, 0.651, 0.9999, 1.0],
  begin: FractionalOffset.topCenter,
  end: FractionalOffset.bottomCenter,
);
