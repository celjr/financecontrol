import 'dart:async';

import 'package:financecontrol/src/core/core_module.dart';
import 'package:financecontrol/src/modules/dashboard/dashboard_module.dart';
import 'package:financecontrol/src/modules/outputs/outputs_module.dart';
import 'package:financecontrol/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/inputs/inputs_module.dart';


class AppModule extends Module {
  @override
  List<Module> get imports => [
    DashboardModule(),
    InputsModule(),
    OutputsModule(),
    CoreModule()
  ];
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule(), guards:  [InitialGuard()]),
    ModuleRoute('/dashboard', module:DashboardModule()),
    ModuleRoute('/inputs', module:InputsModule()),
    ModuleRoute('/outputs', module:OutputsModule()),

  ];
}

class InitialGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }
}
