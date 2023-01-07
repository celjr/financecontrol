import 'package:financecontrol/src/core/services/local_storage/local_storage.dart';
import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/inputs/core/models/input_model.dart';
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
      inputs = localStorage.getData('inputs');
      outputs = localStorage.getData('outputs');

      emit(state.getDataSuccess(inputs: inputs, outputs: outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.getDataFail());
    } catch (e) {
      rethrow;
    }
  }
}
