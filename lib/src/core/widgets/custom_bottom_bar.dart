import 'package:financecontrol/src/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_button_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  final String page;
  const CustomBottomBar({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.all(6),
        height: MediaQuery.of(context).size.width * 0.15,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CustomButtonBottomBar(
            icon: Icons.home,
            label: 'Home',
            isSelected: page == 'home' ? true : false,
            onTap: () => Modular.to.navigate(AppRoutes.dashboard()),
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
