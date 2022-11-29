import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';


class InputsMenuPage extends StatefulWidget {
  const InputsMenuPage({super.key});

  @override
  State<InputsMenuPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entradas'),),
      bottomNavigationBar: CustomBottomBar(page: 'inputs',),
      body: Container(),
    );
  }
}