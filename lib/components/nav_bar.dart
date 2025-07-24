import 'package:flutter/material.dart';
import 'package:it_verse/components/message_screen.dart';
import 'package:it_verse/components/status_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  // Bottom NavBar
  int selectedIndex = 0;

  final List<Widget> pages = [
    // Center(child: Text('Messages')),
    // Center(child: Text('Updates')),
    Expanded(child: MessageScreen()),
    Expanded(child: StatusScreen()),
    Center(child: Text('Communities')),
    Center(child: Text('Calls')),
  ];

  final List<IconData> icons = [
    Icons.message_rounded,
    Icons.update,
    Icons.people_alt_outlined,
    Icons.call,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [pages[selectedIndex]],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              // final labels = ['Message', 'Updates', 'Communities', 'Calls'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      color: selectedIndex == index
                          ? Colors.amber
                          : Colors.white,
                    ),
                    if (selectedIndex == index)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   labels[index],
                    //   style: TextStyle(
                    //     fontSize: 04,
                    //     color: selectedIndex == index
                    //         ? Colors.amber
                    //         : Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
