import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';
import 'view/home_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => HomeBloc(localStorage: i<SharedPreferencesService>()))
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) => HomePage(
              title: 'Finance Control',
              inputs: args.data[0],
              outputs: args.data[1],
            )),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}
