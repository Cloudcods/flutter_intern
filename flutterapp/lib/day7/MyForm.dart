import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Form"),
         backgroundColor: Colors.amber[800],
         centerTitle: true,
      ),
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  labelText: 'Enter your Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
                TextFormField(
                  controller: _lastNameController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  labelText: 'Enter your LastName',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your LastName';
                  }
                  return null;
                },
              ),
                TextFormField(
                  controller: _addressController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  labelText: 'Enter your Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Address';
                  }
                  return null;
                },
              ),
                    TextFormField(
                      controller: _emailController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  labelText: 'Enter your Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
                TextFormField(
                  controller:_passwordController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  labelText: 'Enter your Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter   your Password';
                  }
                  return null;
                },
                  obscureText: true,
              ),
                 Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
              setState(() {
                  _name=_nameController.text;
                  _lastName=_lastNameController.text;
                  _address=_addressController.text;
                  _email=_emailController.text;
                  _password=_passwordController.text;
                });
    // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
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

          );
  }
}