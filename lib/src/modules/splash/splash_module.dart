import 'package:flutter_modular/flutter_modular.dart';

import 'view/splash_page.dart';

class SplashModule extends Module {
 

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const SplashPage())),
  ];
}
