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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _card(
                title: 'Entradas',
                value: '1000',
                width: screenSize.width * 0.42,
                height: screenSize.width * 0.3,
                icon: Icons.input,
                context: context,
                color: Theme.of(context).primaryColor),
            _card(
                title: 'Saidas',
                value: '1000',
                width: screenSize.width * 0.42,
                height: screenSize.width * 0.3,
                context: context,
                color: Colors.red,
                icon: Icons.output)
          ],
        ),
      ),
    );
  }

  Widget _card(
      {required String title,
      required String value,
      required double width,
      required double height,
      required Color color,
      required IconData icon,
      Function()? onTap,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(width * 0.1),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, blurRadius: 2.5, spreadRadius: 0.5)
              ]),
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Theme.of(context).backgroundColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).backgroundColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Text(
                      'R\$ $value',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Theme.of(context).backgroundColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
