import 'package:financecontrol/src/modules/outputs/core/models/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewCreditCardDialog extends StatefulWidget {
  final void Function(CreditCardModel creditCard) addButton;
  final CreditCardModel? card;
  NewCreditCardDialog({super.key, required this.addButton, this.card});

  @override
  State<NewCreditCardDialog> createState() => _NewCreditCardDialogState();
}

class _NewCreditCardDialogState extends State<NewCreditCardDialog> {
  TextEditingController limitController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dueDayController = TextEditingController();

  @override
  void initState() {
    if (widget.card != null) {
      limitController.text = widget.card!.limit.toString();
      nameController.text = widget.card!.name;
      dueDayController.text = widget.card!.duedDayCard.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicione um Cartão'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
              label: Text(
            'Apelido do cartão',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
        ),
        TextFormField(
          controller: limitController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              label: Text(
            'Limite',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
        ),
        TextFormField(
          controller: dueDayController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              label: Text(
            'Dia do vencimento',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
        )
      ]),
      actions: [
        TextButton(onPressed: () => Modular.to.pop(), child: const Text('Voltar')),
        ElevatedButton(
            onPressed: () {
              widget.addButton(CreditCardModel(
                  name: nameController.text,
                  purchases: [],
                  limit: double.parse(limitController.text),
                  duedDayCard: int.parse(dueDayController.text)));
              Modular.to.pop();
            },
            child: const Text('Adicionar'))
      ],
    );
  }
}
