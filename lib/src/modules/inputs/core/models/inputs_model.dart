// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'input_model.dart';

class InputsModel {
  final List<InputModel> inputs;
  double totalInputs = 0;
  InputsModel({
    required this.inputs,
  }) {
    if (inputs.isNotEmpty) {
      for (var input in inputs) {
        totalInputs += input.value;
      }
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inputs': inputs.map((x) => x.toMap()).toList(),
    };
  }

  factory InputsModel.fromMap(Map<String, dynamic> map) {
    return InputsModel(
      inputs: List<InputModel>.from(
        (map['inputs'] as List<int>).map<InputModel>(
          (x) => InputModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory InputsModel.fromJson(String source) =>
      InputsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
