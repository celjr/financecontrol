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
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      bottomNavigationBar: const CustomBottomBar(page: 'home'),
      body: Container(),
    );
  }
}
