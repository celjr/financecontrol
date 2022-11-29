import 'package:flutter/material.dart';

class CustomButtonBottomBar extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String label;
  final void Function()? onTap;

  const CustomButtonBottomBar(
      {super.key,
      required this.icon,
      required this.label,
      this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
