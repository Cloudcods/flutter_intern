import 'package:flutter/material.dart';

class PageviewApp extends StatelessWidget {
  const PageviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text("PageView"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
    );
  }
}