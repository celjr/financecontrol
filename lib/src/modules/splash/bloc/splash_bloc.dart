import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';
import 'package:financecontrol/src/modules/splash/bloc/events/splash_event.dart';
import 'package:financecontrol/src/modules/splash/bloc/states/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashStates> {
  final SharedPreferencesService localStorage;
  SplashBloc({required this.localStorage}) : super(SplashInitialState()) {
    on<InitializeApp>(_initializeApp);
  }

  Future _initializeApp(InitializeApp event, Emitter<SplashStates> emit) async {
    late InputsModel inputs;
    late OutputsModel outputs;
    try {
      String inputsJson;
      String outputsJson;
      if(await localStorage.containData('inputs')){
       inputsJson = localStorage.getData('inputs');
       inputs = InputsModel.fromJson(inputsJson);
      }else{
        inputs = InputsModel.empty();
        localStorage.setData('inputs', inputs.toJson());
      }
      if(await localStorage.containData('outputs')){
       outputsJson = localStorage.getData('outputs');
       outputs = OutputsModel.fromJson(outputsJson);
      }else{
        outputs = OutputsModel.empty();
        localStorage.setData('outputs', outputs.toJson());
      }
      

      emit(state.getDataSuccess(inputs: inputs, outputs: outputs));
    } on SharedPreferencesException  {
      emit(state.getDataFail());
    } catch (e) {
      rethrow;
    }
  }
}
