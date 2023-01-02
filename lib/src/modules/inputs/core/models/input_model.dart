import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InputModel {
  final String description;
  final DateTime date;
  final double value;
  final bool isFixed;
  InputModel({
    this.description = 'Without description',
    required this.date,
    required this.value,
     this.isFixed = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'value': value,
      'isFixed': isFixed,
    };
  }

  factory InputModel.fromMap(Map<String, dynamic> map) {
    return InputModel(
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      value: map['value'] as double,
      isFixed: map['isFixed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory InputModel.fromJson(String source) => InputModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
