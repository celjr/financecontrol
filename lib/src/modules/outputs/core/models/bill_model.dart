import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BillModel {
  final int? id;
  final String name;
  final double value;
  final DateTime dtCreate;
  final DateTime dtDue;
  BillModel({
    this.id,
    required this.name,
    required this.value,
    required this.dtCreate,
    required this.dtDue,
  }); 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'value': value,
      'dtCreate': dtCreate.millisecondsSinceEpoch,
      'dtDue': dtDue.millisecondsSinceEpoch,
    };
  }

  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      value: map['value'] as double,
      dtCreate: DateTime.fromMillisecondsSinceEpoch(map['dtCreate'] as int),
      dtDue: DateTime.fromMillisecondsSinceEpoch(map['dtDue'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String source) => BillModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
