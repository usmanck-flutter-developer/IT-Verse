import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:it_verse/packages/flutter_toast_example.dart';

class IntroductionScreenExample extends StatelessWidget {
  const IntroductionScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        autoScrollDuration: 3500,
        pages: [
          PageViewModel(
            title: "Title of introduction page # 1",
            body: "Welcome to the app! This is a description of how it works.",
            image: const Center(child: Icon(Icons.waving_hand, size: 50.0)),
            useScrollView: true,
          ),
          PageViewModel(
            title: "Title of blue page # 2",
            body:
                "Welcome to the app! This is a description on a page with a blue background.",
            image: Center(
              child: Image.network(
                "https://tse3.mm.bing.net/th/id/OIP.ybvlG8abXeZqs4Avo4eBCwHaHh?rs=1&pid=ImgDetMain&o=7&rm=3",
                height: 175.0,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
            decoration: const PageDecoration(pageColor: Colors.blue),
            useScrollView: true,
          ),
          PageViewModel(
            title: "Title of orange text and bold page # 3",
            body:
                "This is a description on a page with an orange title and bold, big body.",
            image: const Center(
              child: Text("👋", style: TextStyle(fontSize: 100.0)),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Colors.orange),
              bodyTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            ),
            useScrollView: true,
          ),
        ],
        showNextButton: false,
        showSkipButton: false,
        showDoneButton: true,
        done: Text('Go To FTA', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNavigation) => const FlutterToastExample(),
            ),
          );
        },
      ),
    );
  }
}
