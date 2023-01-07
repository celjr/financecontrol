// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:financecontrol/src/modules/outputs/core/models/purchase_model.dart';

class InstallmentPurchaseModel extends PurchaseModel {
  final int installmentsNumber;
  InstallmentPurchaseModel(
      {this.installmentsNumber = 1,
      super.id,
      required super.name,
      required super.value,
      required super.dtBuy});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'installmentsNumber': installmentsNumber,
      'name': name,
      'value': value,
      'dtBuy': dtBuy,
    };
  }

  factory InstallmentPurchaseModel.fromMap(Map<String, dynamic> map) {
    return InstallmentPurchaseModel(
      installmentsNumber: map['installmentsNumber'] as int,
      dtBuy: map['dtBuy'],
      name: map['name'],
      value: map['value'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory InstallmentPurchaseModel.fromJson(String source) =>
      InstallmentPurchaseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
