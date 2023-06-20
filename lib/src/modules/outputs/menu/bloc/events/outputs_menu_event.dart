// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/credit_card_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class OutputsMenuEvent {}

class InitEvent implements OutputsMenuEvent {
  final InputsModel? inputs;
  final OutputsModel? outputs;
  InitEvent({
     this.inputs,
     this.outputs,
  });
}

class AddCreditCard implements OutputsMenuEvent {
  final CreditCardModel creditCard;
  AddCreditCard({
    required this.creditCard,
  });
}


