import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PurchaseModel {
  final int? id;
  final String name;
  final double value;
  final DateTime dtBuy;

  PurchaseModel({
    this.id,
    required this.name,
    required this.value,
    required this.dtBuy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'value': value,
      'dtBuy': dtBuy.millisecondsSinceEpoch,
    };
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      value: map['value'] as double,
      dtBuy: DateTime.fromMillisecondsSinceEpoch(map['dtBuy'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) => PurchaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
