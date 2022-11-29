import 'package:financecontrol/src/app_module.dart';
import 'package:financecontrol/src/core/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp( ModularApp(module: AppModule(), child:const AppWidget() ) );
}




