import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FieldsPage extends StatefulWidget {
  const FieldsPage({super.key});

  @override
  State<FieldsPage> createState() => _FieldsPageState();
}

class _FieldsPageState extends State<FieldsPage> {
   final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _collageController = TextEditingController();
  final _facultyController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


 

// method to saved data from sharedperferences...
 Future<void> _saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('lastName', _lastNameController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('collage', _collageController.text);
    await prefs.setString('faculty', _facultyController.text);
    await prefs.setString('dateOfBirth', _dateOfBirthController.text);
    await prefs.setString('mobileNumber', _mobileNumberController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('confirmPassword', _confirmPasswordController.text);
  }

// method  to load save from data  from sharedperferencces.....
  Future<Map<String, String?>> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username'),
      'lastName': prefs.getString('lastName'),
      'address': prefs.getString('address'),
      'collage': prefs.getString('collage'),
      'faculty': prefs.getString('faculty'),
      'dateOfBirth': prefs.getString('dateOfBirth'),
      'mobileNumber': prefs.getString('mobileNumber'),
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
      'confirmPassword': prefs.getString('confirmPassword'),
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" RegistrationFrom"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
 body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //for username
                TextFormField(
                controller:_usernameController,
                  decoration: InputDecoration(
              prefixIcon: Icon(Icons.person), // Place the icon inside the field
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

                //for lastname
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                   prefixIcon: Icon(Icons.person_2_outlined), // Place the icon inside the field
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

                //for address
           SizedBox(height: 10),
              TextFormField(
             controller:_addressController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.place), // Place the icon inside the field
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

//for collage
                SizedBox(height: 10),
              TextFormField(
             controller:_collageController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.school), 
          border: OutlineInputBorder(),
           labelText: 'Collage',
         hintText: 'Enter Collage',
       ),
        validator: (value) {
         if (value == null || value.isEmpty) {
      return 'Please enter your Collage';
    }
    return null;
  },
),

// for Faculty
      SizedBox(height: 10),
DropdownButtonFormField<String>(
    
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.school), // Place the icon inside the field
    border: OutlineInputBorder(),
    labelText: 'Faculty',
    hintText: 'Select Faculty',
  ),
  items: ['Commerce', 'Science', 'IT'].map((String faculty) {
    return DropdownMenuItem<String>(
      value: faculty,
      child: Text(faculty),
    );
  }).toList(),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select your Faculty';
    }
    return null;
  },
  onChanged: (value) {
   _facultyController.text = value!;
  },
),
        
// for Date of Birth
                SizedBox(height: 10),
                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(),
                    labelText: 'Your Date of Birth',
                    hintText: 'Select Date of Birth',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      _dateOfBirthController.text =
                          pickedDate.toString().split(' ')[0];
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your Date of Birth';
                    }
                    return null;
                  },
                ),
                
//for Mobile number
                SizedBox(height: 10),
                TextFormField(
               controller:_mobileNumberController,
                  decoration: InputDecoration(
                     prefixIcon: Icon(Icons.phone), // Place the icon inside the field
                    border: OutlineInputBorder(),
                    labelText: 'Your Mobile Number',
                    hintText: 'Enter Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your number';
                    }
                    if (value.length < 10) {
      return 'Password must be at least 10 characters long';
    }
                    return null;
                  },
                ),

//for email
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email), // Place the icon inside the field
                    border: OutlineInputBorder(),
                    labelText: 'Your Email',
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
                    
                    return null;
                  },
                ),

                //for password
                SizedBox(height: 10),
                TextFormField(   
                  controller:_passwordController,              
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password), // Place the icon inside the field
                    border: OutlineInputBorder(),
                    labelText: 'Enter Password',
                    hintText: 'Your password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                     if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }        
                ),

                //for confirm password
                SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,    
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded), // Place the icon inside the field
                    border: OutlineInputBorder(),
                    labelText: 'Enter ConfirmPassword',
                    hintText: 'Your ConfirmPassword',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ConfirmPassword';
                    }
                    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
                    return null;

                  },
                ),

             // Submit Button
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.blue, // Set the text color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                    _saveFormData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
                SizedBox(height:20 ),
                FutureBuilder<Map<String, String?>>(
                  future: _loadFormData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final formData = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username: ${formData['username'] ?? ''}'),
                          Text('Last Name: ${formData['lastName'] ?? ''}'),
                          Text('Address: ${formData['address'] ?? ''}'),
                          Text('Collage: ${formData['collage'] ?? ''}'),
                          Text('Faculty: ${formData['faculty'] ?? ''}'),
                          Text('Date of Birth: ${formData['dateOfBirth'] ?? ''}'),
                          Text('Mobile Number: ${formData['mobileNumber'] ?? ''}'),
                          Text('Email: ${formData['email'] ?? ''}'),
                          Text('Password: ${formData['password'] ?? ''}'),
                          Text('Confirm Password: ${formData['confirmPassword'] ?? ''}'),
                        ],
                      );
                    } else {
                      return Text('No data found.');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





