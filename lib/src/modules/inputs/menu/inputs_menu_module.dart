import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/inputs_menu_bloc.dart';
import 'view/inputs_menu_page.dart';



class InputsMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => InputsMenuBloc(localStorage: i<SharedPreferencesService>()))
      ];
  

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) => InputsMenuPage( )),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}