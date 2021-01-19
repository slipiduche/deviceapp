library globals;

import 'package:flutter/material.dart';

String globalType;
String globalChipID = "chipID";
String globalDevName='';
String globalPassword='';
String globalSsid='';
BuildContext updatingContext;
BuildContext updatedContext;
BuildContext errorContext;
bool connecting = false;
bool changing=false;