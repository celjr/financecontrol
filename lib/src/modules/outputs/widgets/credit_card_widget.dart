import 'package:financecontrol/src/modules/outputs/core/models/credit_card_model.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel creditCard; 
  const CreditCardWidget({super.key,required this.creditCard});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: width * 0.65,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.1),
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 2.5, spreadRadius: 0.5)
            ]),
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                   creditCard.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
             const  Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    'R\$ ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  'recommendation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
