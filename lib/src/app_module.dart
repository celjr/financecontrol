import 'package:financecontrol/src/modules/dashboard/presenter/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/view/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage()),
    ChildRoute('/dashboard', child: (context, args) => const HomePage(title: 'Finance Control',))
  ];
}
