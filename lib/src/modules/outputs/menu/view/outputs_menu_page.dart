import 'package:financecontrol/src/core/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class OutputsMenuPage extends StatefulWidget {
  const OutputsMenuPage({super.key});

  @override
  State<OutputsMenuPage> createState() => _OutputsMenuPageState();
}

class _OutputsMenuPageState extends State<OutputsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saidas'),
      ),
      bottomNavigationBar: CustomBottomBar(
        page: 'outputs',
      ),
      body: Container(),
    );
  }
}
