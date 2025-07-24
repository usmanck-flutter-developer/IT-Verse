import 'package:flutter/material.dart';
// import 'package:it_verse/assignments/shared_pref.dart';
import 'package:it_verse/screen/login_shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SharedPref(),
      home: LoginShared(),
    );
  }
}
