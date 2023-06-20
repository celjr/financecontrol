import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/outputs/menu/view/outputs_menu_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/outputs_menu_bloc.dart';



class OutputsMenuModule extends Module {
   @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => OutputsMenuBloc(localStorage: i<SharedPreferencesService>()))
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) => OutputsMenuPage( )),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}