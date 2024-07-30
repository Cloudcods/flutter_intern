import 'package:flutter/material.dart';
import 'package:flutterapp/day7/MyForm.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Form"),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Email',
                  hintText: 'Enter valid mail id as abc@gmail.com',
                ),
              ),
              SizedBox(height: 10), // Add space between the TextField and the next element
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                obscureText: true, // To obscure the password
              ),
              TextButton(
                onPressed: () {
                  // TODO: Forgot password logic
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => FormPage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 244, 156, 23), fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 130),
              Text('New User? Create Account'),
            ],
          ),
        ),
      ),
    );
  }
}
