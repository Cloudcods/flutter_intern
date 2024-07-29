import 'package:flutter/material.dart';

class Singlescrollpage extends StatelessWidget {
  const Singlescrollpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable View"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Set this to horizontal for horizontal scrolling
                itemCount: 30,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  color: Color.fromARGB(255, 60, 194, 53),
                  child: Center(
                    child: Text("Item $index"),
                  ),
                ),
              ),
            ),
          
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling for vertical list
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, index) => Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                color: Colors.green[700],
                child: Center(
                  child: Text(" vertical items $index"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
