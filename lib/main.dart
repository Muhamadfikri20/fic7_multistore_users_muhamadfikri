import 'package:fic7_multistore_users_muhamadfikri/pages/splash/splash_page.dart';

import 'package:flutter/material.dart';

import 'utils/light_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light,
      home: const SplashPage(),
    );
  }
}
