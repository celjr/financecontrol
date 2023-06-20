import 'package:financecontrol/src/core/services/local_storage/shared_preferences.dart';
import 'package:financecontrol/src/modules/inputs/core/models/inputs_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/outputs_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/outputs_menu_event.dart';
import 'states/outputs_menu_state.dart';

class OutputsMenuBloc extends Bloc<OutputsMenuEvent, OutputsMenuStates> {
  final SharedPreferencesService localStorage;
  OutputsMenuBloc({required this.localStorage})
      : super(OutputsMenuInitialState()) {
    on<InitEvent>(_init);
    on<AddCreditCard>(_addCreditCard);
  }

  Future _init(InitEvent event, Emitter<OutputsMenuStates> emit) async {
    try {
      emit(state.loading());

      InputsModel inputs =
          event.inputs ?? InputsModel.fromJson(localStorage.getData('inputs'));
      OutputsModel outputs = event.outputs ??
          OutputsModel.fromJson(localStorage.getData('outputs'));

      emit(state.success(inputs: inputs, outputs: outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.error(mensage: e.message));
    } catch (e) {
      rethrow;
    }
  }

  Future _addCreditCard(
      AddCreditCard event, Emitter<OutputsMenuStates> emit) async {
    try {
      emit(state.loading());
      OutputsModel outputs = state.outputs;

      outputs.creditCards.add(event.creditCard);
      String json = outputs.toJson();
      localStorage.setData('inputs', json);

      emit(state.success(inputs: state.inputs, outputs: outputs));
    } on SharedPreferencesException catch (e) {
      emit(state.error(mensage: e.message));
    } catch (e) {
      rethrow;
    }
  }
}
