// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class InputsMenuStates {
  final InputsModel inputs;
  final OutputsModel outputs;
  final double balence;
  InputsMenuStates({
    required this.inputs,
    required this.outputs,
    required this.balence,
  });

  InputsMenuStateSuccess success(
      {required InputsModel inputs, required OutputsModel outputs}) {
    return InputsMenuStateSuccess(
        inputs: inputs,
        outputs: outputs,
        balence: inputs.totalInputs - outputs.totalOutputs);
  }

  InputsMenuStateErro error({required String mensage}) {
    return InputsMenuStateErro(
      mensage: mensage,
      inputs: inputs,
      outputs: outputs,
      balence: balence,
    );
  }

  InputsMenuStateLoading loading() {
    return InputsMenuStateLoading(inputs: inputs, outputs: outputs, balence: balence);
  }
}

class InputsMenuInitialState extends InputsMenuStates {
  InputsMenuInitialState()
      : super(
            inputs: InputsModel.empty(),
            outputs: OutputsModel.empty(),
            balence: 0);
}

class InputsMenuStateSuccess extends InputsMenuStates {
  InputsMenuStateSuccess({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class InputsMenuStateLoading extends InputsMenuStates {
  InputsMenuStateLoading({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class InputsMenuStateErro extends InputsMenuStates {
  final String mensage;

  InputsMenuStateErro({
    required this.mensage,
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}
