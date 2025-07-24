import 'package:flutter/material.dart';

class TransformWidgetDemo extends StatefulWidget {
  const TransformWidgetDemo({super.key});

  @override
  State<TransformWidgetDemo> createState() => _TransformWidgetDemoState();
}

class _TransformWidgetDemoState extends State<TransformWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4.translationValues(1.0, 1.0, 1.0),
          child: Container(color: Colors.purple, width: 100, height: 100),
        ),
      ),
    );
  }
}
