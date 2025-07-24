// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// // import 'dart:math' as math;

// class AnimatedBuilderDemo extends StatefulWidget {
//   const AnimatedBuilderDemo({super.key});

//   @override
//   State<AnimatedBuilderDemo> createState() => _AnimatedBuilderDemoState();
// }

// class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: controller,
//           builder: (context, child) {
//             return Transform.rotate(
//               // ??
//               angle: controller.value * 2 * 3.1415,
//               child: child,
//             );
//           },
//           child: customCard(),
//         ),
//       ),
//     );
//   }

//   Widget customCard() {
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       color: Colors.white,
//       child: Container(
//         width: 300,
//         height: 180,
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "John Doe",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Flutter Developer",
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 12),
//             Row(
//               children: [
//                 Icon(Icons.phone, size: 16),
//                 SizedBox(width: 8),
//                 Text("+923287654321"),
//               ],
//             ),
//             Row(
//               children: [
//                 Icon(Icons.email, size: 16),
//                 SizedBox(width: 8),
//                 Text("john@example.com"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Front of Card
//   Widget _buildFront() {
//     return _buildCard(
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 36,
//             backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
//           ),
//           SizedBox(height: 12),
//           Text(
//             "Alex Johnson",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }

//   // Back of Card
//   Widget _buildBack() {
//     return Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.identity()..rotateY(math.pi),
//       child: _buildCard(
//         color: Colors.deepPurple[50],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.info_outline, size: 36, color: Colors.deepPurple),
//             SizedBox(height: 12),
//             Text(
//               "Loves creating smooth UIs and playful animations. "
//               "Contact: alex@flutter.dev",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function
//   Widget _buildCard({required Widget child, required Color? color}) {
//     return Card(
//       color: color,
//       elevation: 6, // Controll the Shadow below the Card
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(padding: const EdgeInsets.all(16.0), child: child),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilderDemo extends StatefulWidget {
  const AnimationBuilderDemo({super.key});

  @override
  State<AnimationBuilderDemo> createState() => _AnimationBuilderDemoState();
}

class _AnimationBuilderDemoState extends State<AnimationBuilderDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isFront = true; // ?

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  // Void Funtion
  // ?
  void flipCard() {
    if (isFront) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    isFront = !isFront; // ?
  }

  // Front of The Card
  Widget frontCard() {
    return Container(
      height: 300,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'I am Front',
            style: TextStyle(fontSize: 34, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Back of The Card
  Widget backCard() {
    return Container(
      height: 300,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'I am Back',
            style: TextStyle(fontSize: 34, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flip Card Example")),
      body: Center(
        child: GestureDetector(
          onTap: flipCard,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              double angle = animationController.value * pi; // ?
              bool isFront = angle < pi / 2; // ?
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // ?
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: isFront
                    ? frontCard()
                    : Transform(
                        transform: Matrix4.rotationY(pi), // ?
                        alignment: Alignment.center,
                        child: backCard(),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
