import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:financecontrol/src/core/widgets/custom_button_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      bottomNavigationBar: const CustomBottomBar(page: 'home'),
      body: Column(
        children: [_card(title: 'Entradas', value: '1000', width: screenSize.width *0.4, height: screenSize.width *0.3, context: context)],
      ),
    );
  }

  Widget _card({
    required String title,
    required String value,
    required double width,
    required double height,
    Function()? onTap,
    required BuildContext context
     
  }) {
    return GestureDetector(
      onTap: onTap ?? (){} ,
      child: Container(
        height: height ,
        width: width,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Text(title),
            Text(value),
          ],
        ),
      ),
    );
  }
}
