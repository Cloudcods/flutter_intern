import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedperference extends StatefulWidget {
  const Sharedperference({super.key});

  @override
  State<Sharedperference> createState() => _SharedperferenceState();
}

class _SharedperferenceState extends State<Sharedperference> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _retrievedUsername;
  String? _retrievedEmail;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('email', _emailController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Saved')),
    );
  }

  Future<void> _retrieveData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _retrievedUsername = prefs.getString('username');
      _retrievedEmail = prefs.getString('email');
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _retrievedUsername = '';
      _retrievedEmail = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Cleared')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Demo"),
        backgroundColor: const Color.fromARGB(255, 27, 153, 216),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                  hintText: 'Enter your username',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Email',
                  hintText: 'Enter valid email',
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _saveData,
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: _retrieveData,
                      child: Text('Retrieve'),
                    ),
                    ElevatedButton(
                      onPressed: _clearData,
                      child: Text('Clear'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              if (_retrievedUsername != null && _retrievedEmail != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username: $_retrievedUsername'),
                    Text('Email: $_retrievedEmail'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
