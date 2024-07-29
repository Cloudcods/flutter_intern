
import 'package:flutter/material.dart';
import 'package:flutterapp/day5/dropdown.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 64, 37, 110)),
        useMaterial3: true,
      ),
      home:  const DropDownPage(),
    );
  }
}


