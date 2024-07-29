import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expanded Demo"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: const Text(
                    'First widget',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                color: Color.fromARGB(255, 85, 22, 167),
                height: 100,
                width: 200,
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: const Text(
                      'Second widget',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: Colors.amber,
                  width: 200,
                  height: 100,
                ),
              ),
              Container(
                child: Center(
                  child: const Text(
                    'Third widget',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.orange,
                height: 100,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
