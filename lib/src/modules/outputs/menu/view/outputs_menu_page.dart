import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';
import 'package:flutter/material.dart';

class OutputsMenuPage extends StatefulWidget {
  const OutputsMenuPage({super.key});

  @override
  State<OutputsMenuPage> createState() => _OutputsMenuPageState();
}

class _OutputsMenuPageState extends State<OutputsMenuPage> {
  @override
  Widget build(BuildContext context) {
    OutputsModel outputs = OutputsModel.empty();
    InputsModel inputs =InputsModel.empty();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saidas'),
      ),
      bottomNavigationBar: CustomBottomBar(
        page: 'outputs',
        inputs: inputs,
        outputs: outputs,
      ),
      body: Container(),
    );
  }
}
