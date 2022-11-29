// ignore_for_file: public_member_api_docs, sort_constructors_first
class BillModel {
  final int id;
  final String name;
  final double value;
  final DateTime dtCreate;
  final DateTime dtDue;
  BillModel({
    required this.id,
    required this.name,
    required this.value,
    required this.dtCreate,
    required this.dtDue,
  }); 
}
