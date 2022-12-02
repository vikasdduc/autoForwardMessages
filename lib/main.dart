
import 'package:flutter/material.dart';

import 'homePage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tyreplex Ops',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme()
      ),
      home: const MyHomePage(title: 'Tyreplex Ops'),
    );
  }
}


