import 'package:financecontrol/src/core/utils/formatter.dart';
import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:financecontrol/src/core/widgets/input_dialog.dart';
import 'package:financecontrol/src/modules/inputs/core/models/input_model.dart';
import 'package:financecontrol/src/modules/inputs/menu/bloc/inputs_menu_bloc.dart';
import 'package:financecontrol/src/modules/inputs/menu/bloc/states/inputs_menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/events/inputs_menu_event.dart';

class InputsMenuPage extends StatefulWidget {
  const InputsMenuPage({super.key});

  @override
  State<InputsMenuPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsMenuPage> {
  @override
  void initState() {
    final InputsMenuBloc bloc = Modular.get<InputsMenuBloc>();
    bloc.add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final InputsMenuBloc bloc = Modular.get<InputsMenuBloc>();
    return BlocBuilder<InputsMenuBloc, InputsMenuStates>(
        bloc: bloc,
        builder: (context, state) {
          if (state is InputsMenuStateLoading) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Entradas'),
              ),
              bottomNavigationBar: CustomBottomBar(
                page: 'inputs',
                inputs: state.inputs,
                outputs: null,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Entradas'),
                  actions: [IconButton(onPressed: (){
                    showDialog(context: context, builder: (context) {
                                return InputDialog(
                                  isComplete: true,
                                  addButton: (InputModel input) {
                                    bloc.add(AddInput(input: input));
                                  },
                                );
                              });
                  }, icon: const Icon(Icons.add))],
                ),
                bottomNavigationBar: CustomBottomBar(
                  page: 'inputs',
                  inputs: state.inputs,
                  outputs: null,
                ),
                body: ListView.builder(
                  itemCount: state.inputs.inputs.length,
                  itemBuilder: ((context, index) {
                    InputModel input = state.inputs.inputs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Formatter.doubleToMoney(input.value),
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(input.description),
                                ],
                              ),
                              Column(
                                children: [
                                  TextButton.icon(
                                    label: const Text('Editar'),
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      showDialog(context: context, builder: (context) {
                                return InputDialog(
                                  isComplete: true,
                                  input: input,
                                  addButton: (InputModel input) {
                                    //bloc.add(AddInput(input: input));
                                  },
                                );
                              });
                                    },
                                  ),
                                  TextButton.icon(
                                    label: const Text(
                                      'Deletar',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ));
          }
        });
  }
}
