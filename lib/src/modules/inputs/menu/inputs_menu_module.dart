import 'package:financecontrol/src/modules/outputs/menu/view/outputs_menu_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'view/inputs_menu_page.dart';



class InputsMenuModule extends Module {
  

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) => InputsMenuPage( )),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}