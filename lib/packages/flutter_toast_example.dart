import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastExample extends StatelessWidget {
  const FlutterToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Toast Animate')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: [
                FadeEffect(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.bounceInOut,
                ),
                // BlurEffect(duration: Duration(seconds: 5)),
              ],
              child:
                  ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: 'Cheers! You have Toasted.',
                        backgroundColor: Colors.grey,
                      );
                    },
                    child: Text('Toast Me'),
                  ).animate().scale(
                    alignment: Alignment.center,
                    duration: Duration(seconds: 5),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
