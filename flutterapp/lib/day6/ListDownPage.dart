import 'package:flutter/material.dart';

class ListDropPage extends StatefulWidget {
  const ListDropPage({super.key});

  @override
  State<ListDropPage> createState() => _ListDropPageState();
}

String? SelectedValue;

var items = [
  'items 1',
  'items 2',
  'items 3',
  'items 4',
  'items 5',
  'items 6',
  'items 7',
  'items 8',
  'items 9',
  'items 10',
];

class _ListDropPageState extends State<ListDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown List"),
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
         child: Padding(
            padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: SelectedValue,
              dropdownColor:Colors.amber ,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                  style:  const TextStyle(fontSize: 20)
                  ),

                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  SelectedValue = newValue!;
                });
              },
            ),
                   const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 19),
                backgroundColor: Colors.amber,
              ),
              child: Text(SelectedValue != null ? 'Selected: $SelectedValue' : 'No item selected'),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
