import 'package:flutter/material.dart';

class LearningNewWidgets extends StatefulWidget {
  const LearningNewWidgets({super.key});

  @override
  State<LearningNewWidgets> createState() => _LearningNewWidgetsState();
}

class _LearningNewWidgetsState extends State<LearningNewWidgets> {
  // Veriables
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;

  void _changeBox() {
    setState(() {
      // Change width
      if (_width == 100) {
        _width = 200;
      } else {
        _width = 100;
      }

      // Change height
      if (_height == 100) {
        _height = 200;
      } else {
        _height = 100;
      }

      // Change color
      if (_color == Colors.red) {
        _color = Colors.blue;
      } else {
        _color = Colors.red;
      }
    });
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(title: Text('Animated Container')),
      // body
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: Duration(seconds: 1), // how long the animation takes
          curve: Curves.easeInOut, // smooth animation curve
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeBox,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
