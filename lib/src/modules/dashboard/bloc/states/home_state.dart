// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class HomeStates {
  final InputsModel inputs;
  final OutputsModel outputs;
  final double balence;
  HomeStates({
    required this.inputs,
    required this.outputs,
    required this.balence,
  });

  HomeStateSuccess success(
      {required InputsModel inputs, required OutputsModel outputs}) {
    return HomeStateSuccess(
        inputs: inputs,
        outputs: outputs,
        balence: inputs.totalInputs - outputs.totalOutputs);
  }

  HomeStateErro error({required String mensage}) {
    return HomeStateErro(
      mensage: mensage,
      inputs: inputs,
      outputs: outputs,
      balence: balence,
    );
  }

  HomeStateLoading loading() {
    return HomeStateLoading(inputs: inputs, outputs: outputs, balence: balence);
  }
}

class HomeInitialState extends HomeStates {
  HomeInitialState()
      : super(
            inputs: InputsModel.empty(),
            outputs: OutputsModel.empty(),
            balence: 0);
}

class HomeStateSuccess extends HomeStates {
  HomeStateSuccess({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class HomeStateLoading extends HomeStates {
  HomeStateLoading({
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}

class HomeStateErro extends HomeStates {
  final String mensage;

  HomeStateErro({
    required this.mensage,
    required super.inputs,
    required super.outputs,
    required super.balence,
  });
}
