// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:financecontrol/src/modules/outputs/core/models/installment_purchase_model.dart';

class CreditCardModel {
  final int? id;
  final String name;
  final List<InstallmentPurchaseModel> purchases;
  final double limit;
  final int duedDayCard; 
  CreditCardModel({
     this.id,
    required this.name,
    required this.purchases,
    required this.limit,
    required this.duedDayCard,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'purchases': purchases.map((x) => x.toMap()).toList(),
      'limit': limit,
      'duedDayCard': duedDayCard,
    };
  }

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      purchases: List<InstallmentPurchaseModel>.from((map['purchases']).map<InstallmentPurchaseModel>((x) => InstallmentPurchaseModel.fromMap(x as Map<String,dynamic>),),),
      limit: map['limit'] as double,
      duedDayCard: (map['duedDayCard'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardModel.fromJson(String source) => CreditCardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
