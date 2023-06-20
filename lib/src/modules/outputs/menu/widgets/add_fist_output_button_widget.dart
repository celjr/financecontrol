// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AddFisrtOutputButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String outputType;
  const AddFisrtOutputButtonWidget({
    Key? key,
    required this.onTap,
    required this.outputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Icon(
              Icons.add,
              size: 35,
            ),
            Text('Adicionar $outputType',
                style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
