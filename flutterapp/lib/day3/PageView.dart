import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: PageViewExample(),
    );
  }
}

class PageViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = List<Widget>.generate(10, (index) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/passport.jpeg',
                fit: BoxFit.fill,
                width: 150,
                height: 150,
              ),
              clipper: MyClip(),
            ),
            SizedBox(height: 20),
            Text(
              'Name: suman ghimire ',
              style: TextStyle(fontSize: 26),
              ),
            Text(" it me suman ghimire. i am  a Bca student.currently doing internship in pracas infosys .pracas infosysy is a software company since 2007 ",
           style: TextStyle(fontSize:15),
            ),
            
            Text("Address:Biratnagar-10"),
            
            Text(
              'Page ${index + 1}',
              style: TextStyle(fontSize:19),
            ),
          ],
        ),
      );
    });

    final PageController controller = PageController();

    return PageView(
      controller: controller,
      children: pages,
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: PageViewDemo(),
  ));
}
