import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: FlipProfileCard()));
}

class FlipProfileCard extends StatefulWidget {
  const FlipProfileCard({super.key});

  @override
  FlipProfileCardState createState() => FlipProfileCardState();
}

class FlipProfileCardState extends State<FlipProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Function
  void _flipCard() {
    if (isFront) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double angle = controller.value * pi;
              // Flip halfway and show back
              bool showBack = angle > (pi / 2);

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // for 3D depth
                  ..rotateY(angle),
                child: Container(
                  width: 300,
                  height: 200,
                  child: showBack ? _buildBack() : _buildFront(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Front of Card
  Widget _buildFront() {
    return _buildCard(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
          SizedBox(height: 12),
          Text(
            "Alex Johnson",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Back of Card
  Widget _buildBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: _buildCard(
        color: Colors.deepPurple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 36, color: Colors.deepPurple),
            SizedBox(height: 12),
            Text(
              "Loves creating smooth UIs and playful animations. "
              "Contact: alex@flutter.dev",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Function
  Widget _buildCard({required Widget child, required Color? color}) {
    return Card(
      color: color,
      elevation: 6, // Controll the Shadow below the Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}
