import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/splash/bloc/splash_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'view/splash_page.dart';

class SplashModule extends Module {
  
  

  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => SplashBloc(localStorage: i<SharedPreferencesService>()))
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const SplashPage())),
  ];
}
