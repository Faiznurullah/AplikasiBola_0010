import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  int? _selectedGender = 1; 
  bool passwordInvisible = true;
  bool confirmPasswordInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  "Selamat Datang Bobotoh!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Silahkan daftar untuk melanjutkan ke aplikasi Persib Bandung Official.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
          
                SizedBox(height: 20),
          
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'Name'),
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
          
                      SizedBox(height: 16),
          
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'Alamat'),
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
          
                      SizedBox(height: 16),
          
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'No. Telpon'),
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
          
                      SizedBox(height: 16),
          
                      // Kata Gugel Pakai Radio Button
                       Text("Jenis Kelamin: ", 
                           textAlign: TextAlign.start,),

                      Column( 
                        children: [
                          
                           SizedBox(height: 10),
                          Row(
                            children: [ 
                              SizedBox(width: 10),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(value: 1, groupValue: _selectedGender, onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    }),
                                    Text("Laki-laki"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(value: 2, groupValue: _selectedGender, onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    }),
                                    Text("Perempuan"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
          
           
                       TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'Email'),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (value.contains('@') == false) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                       ),

                      SizedBox(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordInvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordInvisible = !passwordInvisible;
                              });
                            },
                          ),
                        ),
                        controller: _passwordController,
                        obscureText: passwordInvisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                       ),

                      SizedBox(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              confirmPasswordInvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                confirmPasswordInvisible = !confirmPasswordInvisible;
                              });
                            },
                          ),
                        ),
                        controller: _confirmPasswordController,
                        obscureText: confirmPasswordInvisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                       ),

                      SizedBox(height: 16),

                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              }
                          },
                          child: Text('Daftar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
