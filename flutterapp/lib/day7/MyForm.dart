import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _name;
  String? _lastName;
  String? _address;
  String? _email;
  String? _password;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('username') ?? '';
      _lastNameController.text = prefs.getString('lastname') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    await prefs.setString('lastname', _lastNameController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Form"),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LastName',
                    hintText: 'Enter LastName',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Enter Address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Email',
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter password',
                    hintText: 'Your password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _name = _nameController.text;
                          _lastName = _lastNameController.text;
                          _address = _addressController.text;
                          _email = _emailController.text;
                          _password = _passwordController.text;
                        });
                        _saveData();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
                if (_name != null &&
                    _lastName != null &&
                    _address != null &&
                    _email != null &&
                    _password != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: $_name'),
                        Text('LastName: $_lastName'),
                        Text('Address: $_address'),
                        Text('Email: $_email'),
                        Text('Password: $_password'),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 130,
                ),
                Text('New User? Please Login')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
