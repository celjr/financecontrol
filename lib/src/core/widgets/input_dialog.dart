import 'package:financecontrol/src/modules/inputs/core/models/input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InputDialog extends StatefulWidget {
  final bool isComplete;
  final void Function(InputModel input) addButton;
  final InputModel? input;
  InputDialog({super.key, this.isComplete = false, required this.addButton, this.input});

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  TextEditingController valueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if(widget.input != null){
      valueController.text = widget.input!.value.toString();
      descriptionController.text = widget.input!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicione uma entrada'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.isComplete
            ? [
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      label: Text(
                    'Descrição',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                ),
                TextFormField(
                  controller: valueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(
                    'Valor',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                )
              ]
            : [
                TextFormField(
                  controller: valueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(
                    'Valor',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                )
              ],
      ),
      actions: [
        TextButton(onPressed: () => Modular.to.pop(), child: Text('Voltar')),
        ElevatedButton(
            onPressed: () {
              widget.addButton(widget.isComplete
                  ? InputModel(
                      description: descriptionController.text,
                      date: DateTime.now(),
                      value: double.parse(valueController.text))
                  : InputModel(
                      date: DateTime.now(),
                      value: double.parse(valueController.text)));

                      Modular.to.pop();
            },
            child: const Text('Adicionar'))
      ],
    );
  }
}
