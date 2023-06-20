import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/home_event.dart';
import 'states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  final SharedPreferencesService localStorage;
  HomeBloc({required this.localStorage}) : super(HomeInitialState()) {
    on<InitEvent>(_init);
    on<AddInput>(_addInput);
  }

  Future _init(InitEvent event, Emitter<HomeStates> emit) async {
    try {
      emit(state.loading());

      InputsModel inputs = event.inputs ?? InputsModel.fromJson(localStorage.getData('inputs')) ;
      OutputsModel outputs =  event.outputs ?? OutputsModel.fromJson(localStorage.getData('outputs')) ;

      emit(state.success(inputs: inputs, outputs: outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.error(mensage: e.message));
    } catch (e) {
      rethrow;
    }
  }

  Future _addInput(AddInput event, Emitter<HomeStates> emit) async {
    try {
      emit(state.loading());
      InputsModel inputs = state.inputs;

      inputs.inputs.add(event.input);
      String json = inputs.toJson();
      localStorage.setData('inputs', json);

      inputs.updateTotal();


      emit(state.success(inputs: inputs, outputs: state.outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.error(mensage: e.message));
    } catch (e) {
      rethrow;
    }
  }
}
