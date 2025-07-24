import 'package:flutter/material.dart';

class ConditionOnWidget extends StatefulWidget {
  const ConditionOnWidget({super.key});

  @override
  State<ConditionOnWidget> createState() => _ConditionOnWidgetState();
}

class _ConditionOnWidgetState extends State<ConditionOnWidget> {
  bool showFruits = false;

  List<String> fruitsName = ['Apple', 'Mango', 'Banana', 'Orange', 'Pineapple'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conditions On Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showFruits = !showFruits;
                });
              },
              child: Text('Press me to Show Fruits Names'),
            ),
            if (showFruits)
              ...List.generate(
                fruitsName.length,
                (index) => Text(fruitsName[index]),
              ),
          ],
        ),
      ),
    );
  }
}
