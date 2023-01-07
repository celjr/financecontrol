// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

abstract class SplashStates {
  SplashGetDataSuccessState getDataSuccess(
      {required InputsModel inputs, required OutputsModel outputs}) {
    return SplashGetDataSuccessState(inputs: inputs, outputs: outputs);
  }
  SplashGetDataFailState getDataFail(){
    return SplashGetDataFailState();
  }
}

class SplashInitialState extends SplashStates {}

class SplashGetDataSuccessState extends SplashStates{
  final InputsModel inputs;
  final OutputsModel outputs;
  SplashGetDataSuccessState({
    required this.inputs,
    required this.outputs,
  });
}

class SplashGetDataFailState extends SplashStates {
  InputsModel inputs = InputsModel.empty();
  OutputsModel outputs = OutputsModel.empty();
}

class SplashErrorState extends SplashStates {}
