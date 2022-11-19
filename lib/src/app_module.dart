import 'package:financecontrol/src/modules/dashboard/dashboard_module.dart';
import 'package:financecontrol/src/modules/dashboard/view/home_page.dart';
import 'package:financecontrol/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/view/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/dashboard', module:DashboardModule())
  ];
}
