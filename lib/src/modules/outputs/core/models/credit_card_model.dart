// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financecontrol/src/modules/outputs/core/models/installment_purchase_model.dart';

class CreditCardModel {
  final int id;
  final String name;
  final List<InstallmentPurchaseModel> purchases;
  final double limit;
  final DateTime dueCard; 
  CreditCardModel({
    required this.id,
    required this.name,
    required this.purchases,
    required this.limit,
    required this.dueCard,
  });
}
