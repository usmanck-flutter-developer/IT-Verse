import 'package:flutter/material.dart';
import 'package:it_verse/components/message_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginShared extends StatefulWidget {
  const LoginShared({super.key});

  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? checkEmail;
  String? checkPassword;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? checkEmail = prefs.getString('Email');
    final String? checkPassword = prefs.getString('Password');

    if (checkEmail != null || checkPassword != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessageScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login for Shared Pref'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text('Enter Email...'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 6,
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text('Enter Password...'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 6,
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(alignment: Alignment.center),
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('Email', emailController.text);
                  await prefs.setString('Password', passwordController.text);
                  // Clear TextField on Saving Data
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text('Save Data'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final String? checkEmail = prefs.getString('Email');
                  final String? checkPassword = prefs.getString('Password');
                  print(checkEmail);
                  print(checkPassword);
                },
                child: Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
