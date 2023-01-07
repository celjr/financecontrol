// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:financecontrol/src/modules/outputs/core/models/bill_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/credit_card_model.dart';
import 'package:financecontrol/src/modules/outputs/core/models/purchase_model.dart';

class OutputsModel {
  final List<PurchaseModel> purchases;
  final List<BillModel> bills;
  final List<CreditCardModel> creditCards;
  double totalOutputs = 0;
  OutputsModel({
    required this.purchases,
    required this.bills,
    required this.creditCards,
  }) {
    if (purchases.isNotEmpty) {
      for (var purchase in purchases) {
        totalOutputs += purchase.value;
      }
    }
    if (bills.isNotEmpty) {
      for (var bill in bills) {
        totalOutputs += bill.value;
      }
    }
  }

  factory OutputsModel.empty() {
    return OutputsModel(purchases: [], bills: [], creditCards: []);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchases': purchases.map((x) => x.toMap()).toList(),
      'bills': bills.map((x) => x.toMap()).toList(),
      'creditCards': creditCards.map((x) => x.toMap()).toList(),
      'totalOutputs': totalOutputs,
    };
  }

  factory OutputsModel.fromMap(Map<String, dynamic> map) {
    return OutputsModel(
      purchases: List<PurchaseModel>.from(
        (map['purchases'] as List<int>).map<PurchaseModel>(
          (x) => PurchaseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bills: List<BillModel>.from(
        (map['bills'] as List<int>).map<BillModel>(
          (x) => BillModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      creditCards: List<CreditCardModel>.from(
        (map['creditCards'] as List<int>).map<CreditCardModel>(
          (x) => CreditCardModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OutputsModel.fromJson(String source) =>
      OutputsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
