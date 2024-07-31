import 'package:flutter/material.dart';//
import 'package:flutterapp/day4/pages/contact_page.dart';
import 'package:flutterapp/day4/pages/home_page.dart';
import 'package:flutterapp/day4/pages/message_page.dart';
import 'package:flutterapp/day4/pages/notification_page.dart';
import 'package:flutterapp/day4/pages/profile_page.dart';
//Importing necessary packages and files for the application. flutter/material.dart is the core Flutter package for material design
class Appbarpage extends StatefulWidget {
  const Appbarpage({super.key});

  @override
  State<Appbarpage> createState() => _AppbarpageState();
}

class _AppbarpageState extends State<Appbarpage> {
 //currentIndex is a variable to keep track of the currently selected page in the bottom navigation bar. 
 int currentIndex = 0; 
 static const List<Widget> _pages = <Widget>[
  //pages is  a list widget.
   HomePage(), //index 0
   ProfilePage(),//index 1
   MessagePage(),//index 2
   Notificationpageview(),//index 3
   ContactPage(),//  index 4
   
  ];

  @override
  Widget build(BuildContext context) {
    //scaffold is the top-level of container for appbar ,body and navigationbaritem...
    return Scaffold(
      appBar: AppBar(
        title: const Text("PRACAS Infosys"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        //circular image in action..in right side..from image.assset...
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              
              child: Image.asset(
                'assets/images/magic.jpg',
                fit: BoxFit.cover,
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
        ],
        //circular image in leading....left side
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/images/passport.jpeg',
              fit: BoxFit.cover,
              width: 40.0,
              height: 40.0,
            ),
          ),
        ),
      ),

      body: _pages[currentIndex],//Displays the current page based on currentIndex.

      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 62, 111, 63),
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
          currentIndex = index;
          });
        },
        // for icon and text under the buttonNavigationbaritem...
        items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
        color:Colors.black,
        ), 
        label: "Profile", ),


        BottomNavigationBarItem(
          icon: Icon(Icons.message,
          color: Colors.black,
        ), 
        label: "chat"),

        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add,
          color: Colors.black,
          ), 
          label: "notification"),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone,
          color: Colors.black,
          ),
           label: "contact"),
          
      ]),
    );
  }
}
