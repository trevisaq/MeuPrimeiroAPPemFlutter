import 'package:flutter/material.dart';
import 'package:trevisan_streaming/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: 
      ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 0, 0, 0)),
      useMaterial3:true),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

