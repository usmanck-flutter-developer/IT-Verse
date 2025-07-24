// import 'package:flutter/material.dart';

// class StatusScreen extends StatefulWidget {
//   const StatusScreen({super.key});

//   @override
//   State<StatusScreen> createState() => _StatusScreenState();
// }

// class _StatusScreenState extends State<StatusScreen> {
//   final List<Widget> myStatus = [
//     Column(
//       children: [
//         //1
//         Stack(
//           children: [
//             Container(height: 90, width: 60, color: Colors.grey),
//             ClipOval(
//               child: Container(color: Colors.green, child: Icon(Icons.add)),
//             ),
//             Text('Status'),
//           ],
//         ),
//         // 2
//         Stack(
//           children: [
//             Container(height: 90, width: 60, color: Colors.grey),
//             ClipOval(
//               child: Container(color: Colors.green, child: Icon(Icons.add)),
//             ),
//             Text('Status'),
//           ],
//         ),
//         //3
//         Stack(
//           children: [
//             Container(height: 90, width: 60, color: Colors.grey),
//             ClipOval(
//               child: Container(color: Colors.green, child: Icon(Icons.add)),
//             ),
//             Text('Status'),
//           ],
//         ),
//       ],
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // AppBar
//       appBar: AppBar(
//         title: Text('Updates', style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),

//           IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
//         ],
//       ),
//       // AppBar Ends
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Status'),
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: myStatus.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: myStatus[index],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final List<Map<String, dynamic>> statusList = [
    {'name': 'You', 'color': Colors.green},
    {'name': 'Alice', 'color': Colors.red},
    {'name': 'Bob', 'color': Colors.orange},
    {'name': 'Clara', 'color': Colors.purple},
    {'name': 'David', 'color': Colors.blue},
    {'name': 'Ella', 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.camera_alt_outlined),
          // SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statusList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: statusList[index]['color'],
                            child: Text(
                              statusList[index]['name'][0],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (index == 0) // only show "+" on your own status
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.green,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        statusList[index]['name'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
