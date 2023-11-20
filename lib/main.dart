import 'package:flutter/material.dart';
import 'package:route_mobile_task/injoy_app.dart';

import 'config/injection/di.dart';

void main() {
  configureDependencies();

  runApp(const InjoyApp());
}



