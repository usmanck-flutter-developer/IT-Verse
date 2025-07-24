import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  label: Text('Type Here...'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 6,
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('job', textFieldController.text);
                },
                child: Text('Save Data'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final String? jobVar = prefs.getString('job');
                  print('Stored Value: ${jobVar}');
                },
                child: Text('Load Data'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('job');
                },
                child: Text('Remove Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
