import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastPkg extends StatefulWidget {
  const FlutterToastPkg({super.key});

  @override
  State<FlutterToastPkg> createState() => _FlutterToastPkgState();
}

class _FlutterToastPkgState extends State<FlutterToastPkg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            for (int i = 0; i < 5; i++)
              if (i % 2 == 0) ...[
                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'I am a Toast',
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.purple,
                      textColor: Colors.white,
                      fontSize: 24,
                      gravity: ToastGravity.TOP,
                    );
                  },
                  child: Text('Print Toast'),
                ),
              ] else
                Text('DATA'),
            ...List.generate(5, (index) => Text('Text ${index + 1}')),
          ],
        ),
      ),
    );
  }
}
