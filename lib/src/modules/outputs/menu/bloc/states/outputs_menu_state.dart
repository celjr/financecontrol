// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class OutputsMenuStates {
  final InputsModel inputs;
  final OutputsModel outputs;
  final double balence;
  OutputsMenuStates({
    required this.inputs,
    required this.outputs,
    required this.balence,
  });

  OutputsMenuStateSuccess success(
      {required InputsModel inputs, required OutputsModel outputs}) {
    return OutputsMenuStateSuccess(
        inputs: inputs,
        outputs: outputs,
        balence: inputs.totalInputs - outputs.totalOutputs);
  }

  OutputsMenuStateErro error({required String mensage}) {
    return OutputsMenuStateErro(
      mensage: mensage,
      inputs: inputs,
      outputs: outputs,
      balence: balence,
    );
  }

  OutputsMenuStateLoading loading() {
    return OutputsMenuStateLoading(
        inputs: inputs, outputs: outputs, balence: balence);
  }
}

class OutputsMenuInitialState extends OutputsMenuStates {
  OutputsMenuInitialState()
      : super(
            inputs: InputsModel.empty(),
            outputs: OutputsModel.empty(),
            balence: 0);
}

class OutputsMenuStateSuccess extends OutputsMenuStates {
  OutputsMenuStateSuccess({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class OutputsMenuStateLoading extends OutputsMenuStates {
  OutputsMenuStateLoading({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class OutputsMenuStateErro extends OutputsMenuStates {
  final String mensage;

  OutputsMenuStateErro({
    required this.mensage,
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}
