import 'package:financecontrol/src/core/utils/formatter.dart';
import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:financecontrol/src/core/widgets/date_header_widget.dart';
import 'package:financecontrol/src/core/widgets/input_dialog.dart';
import 'package:financecontrol/src/modules/dashboard/bloc/events/home_event.dart';
import 'package:financecontrol/src/modules/dashboard/bloc/home_bloc.dart';
import 'package:financecontrol/src/modules/dashboard/bloc/states/home_state.dart';
import 'package:financecontrol/src/modules/inputs/core/models/input_model.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../outputs/core/models/outputs_model.dart';

class HomePage extends StatefulWidget {
  final InputsModel? inputs;
  final OutputsModel? outputs;
  const HomePage(
      {super.key,
      required this.title,
      required this.inputs,
      required this.outputs});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    final HomeBloc bloc = Modular.get<HomeBloc>();
    bloc.add(InitEvent(inputs: widget.inputs, outputs: widget.outputs));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Modular.get<HomeBloc>();
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc,HomeStates>(
      bloc: bloc,
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text(widget.title)),
          bottomNavigationBar: CustomBottomBar(
            page: 'home',
            inputs: state.inputs,
            outputs: state.outputs,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const DateHeaderWidget(),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _card(
                        title: 'Entradas',
                        value: state.inputs.totalInputs.toString(),
                        width: screenSize.width * 0.42,
                        height: screenSize.width * 0.4,
                        icon: Icons.input,
                        context: context,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return InputDialog(
                                  addButton: (InputModel input) {
                                    bloc.add(AddInput(input: input));
                                  },
                                );
                              });
                        },
                        color: Theme.of(context).primaryColor),
                    _card(
                        title: 'Saidas',
                        value: state.outputs.totalOutputs.toString(),
                        width: screenSize.width * 0.42,
                        height: screenSize.width * 0.4,
                        context: context,
                        color: Colors.red,
                        icon: Icons.output)
                  ],
                ),
                _cardSaldo(
                    title: 'Saldo',
                    value: (state.balence)
                        .toString(),
                    width: screenSize.width * 0.42,
                    height: screenSize.width * 0.4,
                    icon: Icons.savings_outlined,
                    context: context),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _card(
      {required String title,
      required String value,
      required double width,
      required double height,
      required Color color,
      required IconData icon,
      Function()? onTap,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(width * 0.1),
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 2.5, spreadRadius: 0.5)
            ]),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).backgroundColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).backgroundColor),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    'R\$ $value',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).backgroundColor),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: onTap ?? () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                  height: width * 0.2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Adicionar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: color),
                      ),
                      Icon(icon, color: color)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardSaldo(
      {required String title,
      required String value,
      required double width,
      required double height,
      required IconData icon,
      required BuildContext context}) {
    Color color;
    String recommendation;
    double valueDouble = double.parse(value);
    if (valueDouble > 0) {
      color = Theme.of(context).primaryColor;
      recommendation =
          'Se quiser economizar ou investir uma graninha continua assim que vai sobrar um money esse mês!';
    } else if (valueDouble < 0) {
      color = Colors.red;
      recommendation =
          'Olha, tenta diminuir os gastos, e ganhar mais algum trocado ainda esse mês ainda!';
    } else {
      color = Colors.black;
      recommendation = 'Está ok, só não pode gastar mais nada!';
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.1),
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 2.5, spreadRadius: 0.5)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: 40,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: color),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    'R\$ $value',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: color),
                  ),
                ],
              ),
              Center(
                child: Text(
                  recommendation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: valueDouble == 0 ? Colors.black : color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
