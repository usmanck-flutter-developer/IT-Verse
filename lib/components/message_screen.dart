import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController rotateController;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    rotateController.forward();
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),

          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),

      // AppBar Ends
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 3),
                    Text('Ask Meta AI or Search'),
                  ],
                ),
              ),
            ),

            // ANIMATION
            FadeTransition(
              opacity: Tween<double>(begin: .5, end: 1).animate(controller),
              child: ElevatedButton(
                onPressed: () {
                  controller.reverse();
                },
                child: Text('Fade Animate'),
              ),
            ),
            SizedBox(height: 30),

            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-3, 0),
                end: Offset.zero,
              ).animate(controller),
              child: ElevatedButton(
                onPressed: () {
                  controller.reverse();
                },
                child: Text('Slide Animate'),
              ),
            ),
            SizedBox(height: 30),

            ScaleTransition(
              filterQuality: FilterQuality.high,
              scale: Tween<double>(begin: .5, end: 1.0).animate(
                CurvedAnimation(parent: controller, curve: Curves.decelerate),
              ),
              child: ElevatedButton(
                onPressed: () {
                  controller.reverse();
                },
                child: Text('Scale Animate'),
              ),
            ),
            SizedBox(height: 30),
            RotationTransition(
              turns: Tween<double>(begin: 0.0, end: 2.0).animate(
                CurvedAnimation(
                  parent: rotateController,
                  curve: Curves.bounceIn,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  rotateController.reset();
                  rotateController.forward();
                },
                child: Text('Rotate Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
