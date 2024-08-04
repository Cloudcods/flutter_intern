import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/day1/Listview.dart';
import 'package:flutterapp/day2/home-page.dart';
import 'package:flutterapp/day3/PageView.dart';
import 'package:flutterapp/day4/appbarpage.dart';
import 'package:flutterapp/day5/singlescrollpage.dart';
import 'package:flutterapp/day6/ListDownPage.dart';
import 'package:flutterapp/day7/MyForm.dart';
import 'package:flutterapp/day8/form.dart';
import 'package:flutterapp/day9/Fields.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  final _formKey = GlobalKey<FormState>();
  int currentIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ListViewPage(),              //index 0
    MyHomePage(),                //index 1
    PageViewDemo(),              //index 2
    Appbarpage(),                //index 3
    Singlescrollpage(),          //index 4
    ListDropPage(),              //index 5
    FormPage(),                  //index 6
    SharedPreferenceDemo(),      //index 7
    FieldsPage(),                //index 8
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 188, 167, 44),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField<String>(
                  dropdownColor: Color.fromARGB(255, 188, 167, 44),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.pages),
                    border: OutlineInputBorder(),
                    labelText: 'Pages',
                    hintText: 'Select Pages',
                  ),
                  items: [
                    'Page1', 'Page2', 'Page3',
                    'Page4', 'Page5', 'Page6',
                    'Page7', 'Page8', 'Page9'
                  ].map((String pages) {
                    return DropdownMenuItem<String>(
                      value: pages,
                      child: Text(pages),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select your pages';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    
                    print(value);
                    setState(() {
                      currentIndex = [
                        'Page1', 'Page2', 'Page3',
                        'Page4', 'Page5', 'Page6',
                        'Page7', 'Page8', 'Page9'
                      ].indexOf(value!);
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 188, 167, 44),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to the selected page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _pages[currentIndex],
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Submitted')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
                
                // Optionally display the selected page below the form
                // _pages[currentIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
