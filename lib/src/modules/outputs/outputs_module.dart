import 'package:flutter_modular/flutter_modular.dart';

import 'menu/outputs_menu_module.dart';



class OutputsModule extends Module {
  @override
  List<Module> get imports => [
    OutputsMenuModule()
  ];


  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/menu', module: OutputsMenuModule()),
    
  ];
}