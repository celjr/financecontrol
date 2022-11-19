import 'package:flutter_modular/flutter_modular.dart';

import 'view/home_page.dart';

class DashboardModule extends Module {
  

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) => HomePage( title: 'Finance Control',)),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}