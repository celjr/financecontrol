import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';
import 'package:financecontrol/src/modules/outputs/menu/bloc/events/outputs_menu_event.dart';
import 'package:financecontrol/src/modules/outputs/menu/bloc/outputs_menu_bloc.dart';
import 'package:financecontrol/src/modules/outputs/menu/bloc/states/outputs_menu_state.dart';
import 'package:financecontrol/src/modules/outputs/widgets/credit_card_widget.dart';
import 'package:financecontrol/src/modules/outputs/widgets/new_credit_card_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/add_fist_output_button_widget.dart';

class OutputsMenuPage extends StatefulWidget {
  const OutputsMenuPage({super.key});

  @override
  State<OutputsMenuPage> createState() => _OutputsMenuPageState();
}

class _OutputsMenuPageState extends State<OutputsMenuPage> {



  @override
  Widget build(BuildContext context) {
    OutputsModel outputs = OutputsModel.empty();
    InputsModel inputs = InputsModel.empty();
    final OutputsMenuBloc bloc = Modular.get<OutputsMenuBloc>();
    return BlocBuilder<OutputsMenuBloc, OutputsMenuStates>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saidas'),
            ),
            bottomNavigationBar: CustomBottomBar(
              page: 'outputs',
              inputs: inputs,
              outputs: outputs,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cartões(${state.outputs.creditCards.length})',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          TextButton(
                              onPressed: () {}, child: const Text('Ver todos'))
                        ],
                      ),
                      if (state.outputs.creditCards.isEmpty)
                        AddFisrtOutputButtonWidget(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return NewCreditCardDialog(
                                    addButton: (creditCard) => bloc
                                        .add(AddCreditCard(creditCard: creditCard)),
                                  );
                                });
                          },
                          outputType: 'cartão',
                        ),
                        if (state.outputs.creditCards.isNotEmpty)
                        ...state.outputs.creditCards.map((card) {
                          return CreditCardWidget(creditCard: card);
                        })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Contas(${state.outputs.bills.length})',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          TextButton(
                              onPressed: () {}, child: const Text('Ver todos'))
                        ],
                      ),
                      if (state.outputs.bills.isEmpty)
                        AddFisrtOutputButtonWidget(
                          onTap: () {},
                          outputType: 'conta',
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Compras(${state.outputs.purchases.length})',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text('Ver todos'))
                        ],
                      ),
                      if (state.outputs.purchases.isEmpty)
                        AddFisrtOutputButtonWidget(
                          onTap: () {},
                          outputType: 'compra',
                        )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
