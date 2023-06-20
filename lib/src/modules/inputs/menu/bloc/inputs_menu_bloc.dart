import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/inputs_menu_event.dart';
import 'states/inputs_menu_state.dart';

class InputsMenuBloc extends Bloc<InputsMenuEvent, InputsMenuStates> {
  final SharedPreferencesService localStorage;
  InputsMenuBloc({required this.localStorage}) : super(InputsMenuInitialState()) {
    on<InitEvent>(_init);
    on<AddInput>(_addInput);
  }

  Future _init(InitEvent event, Emitter<InputsMenuStates> emit) async {
    try {
      emit(state.loading());

      InputsModel inputs = event.inputs ?? InputsModel.fromJson(localStorage.getData('inputs'));
      OutputsModel outputs = event.outputs ?? OutputsModel.fromJson(localStorage.getData('outputs'));

      emit(state.success(inputs: inputs, outputs: outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.error(mensage: e.message));
    } catch (e) {
      rethrow;
    }
  }

  Future _addInput(AddInput event, Emitter<InputsMenuStates> emit) async {
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
