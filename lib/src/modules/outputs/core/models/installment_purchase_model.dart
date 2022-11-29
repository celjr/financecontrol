import 'package:financecontrol/src/modules/outputs/core/models/purchase_model.dart';

class InstallmentPurchaseModel extends PurchaseModel {
  final int installmentsNumber;
  InstallmentPurchaseModel(
      {required this.installmentsNumber,
      required super.id,
      required super.name,
      required super.value,
      required super.dtBuy});
}
