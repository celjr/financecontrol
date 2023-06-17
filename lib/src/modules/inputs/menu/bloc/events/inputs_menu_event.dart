// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/input_model.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class InputsMenuEvent {}

class InitEvent implements InputsMenuEvent {
  final InputsModel? inputs;
  final OutputsModel? outputs;
  InitEvent({
     this.inputs,
     this.outputs,
  });
}

class AddInput implements InputsMenuEvent {
  final InputModel input;
  AddInput({
    required this.input,
  });
}


