import 'package:flutter/material.dart';
import 'package:trevisan_streaming/pages/login.dart';
import 'package:trevisan_streaming/pages/cadastro.dart';
import 'package:trevisan_streaming/shared/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulClaro),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        // '/home' : (context) => const Home(),
      },
    );
  }
}
