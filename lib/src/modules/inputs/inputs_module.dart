import 'package:flutter_modular/flutter_modular.dart';

import 'menu/inputs_menu_module.dart';





class InputsModule extends Module {
  @override
  List<Module> get imports => [
    InputsMenuModule()
  ];


  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/menu', module: InputsMenuModule()),
    
  ];
}