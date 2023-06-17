import 'package:financecontrol/src/core/utils/formatter.dart';
import 'package:flutter/material.dart';

class DateHeaderWidget extends StatelessWidget {
  const DateHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateTime.now().day.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'de',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          Formatter.monthName(DateTime.now().month),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          DateTime.now().year.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
      ],
    );
  }
}
