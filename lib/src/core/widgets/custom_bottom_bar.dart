import 'package:financecontrol/src/app_routes.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_button_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  final String page;
  final InputsModel? inputs;
  final OutputsModel? outputs;
  const CustomBottomBar({super.key, required this.page, required this.inputs, required this.outputs});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: MediaQuery.of(context).size.width * 0.14,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomButtonBottomBar(
            icon: Icons.home,
            label: 'Home',
            isSelected: page == 'home' ? true : false,
            onTap: () => Modular.to.navigate(AppRoutes.dashboard(),arguments: [inputs,outputs]),
          ),
          CustomButtonBottomBar(
            icon: Icons.input,
            label: 'Entradas',
            isSelected: page == 'inputs' ? true : false,
            onTap: () => Modular.to.navigate(AppRoutes.inputsMenu())
          ),
          CustomButtonBottomBar(
            icon: Icons.output,
            label: 'Saidas',
            isSelected: page == 'outputs' ? true : false,
            onTap: () => Modular.to.navigate(AppRoutes.outputsMenu())
          ),
          CustomButtonBottomBar(
            icon: Icons.settings,
            label: 'Configurações',
            isSelected: page == 'settings' ? true : false,
          )
        ]),
      ),
    );
  }
}
