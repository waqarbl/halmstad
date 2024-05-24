import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/pages/authentication/forgot_password.dart';
import 'package:halmstad/pages/authentication/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: const Color.fromARGB(255, 1, 3, 90),
              child: Center(
                  child: Container(
                      width: 260,
                      height: 130,
                      child: Image.asset('assets/halmstadLogo.png'))),
            ),
            Expanded(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: const Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 1, 3, 90)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: const Text(
                          "Please enter the following details to Register.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: TextFormField(
                          controller: firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter First Name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'First Name',
                            hintText: 'John',
                            // helperText: 'supporting text',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          controller: lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Last Name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Last Name',
                            hintText: 'Doe',
                            // helperText: 'supporting text',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!RegExp(pattern)
                                .hasMatch(emailController.text)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            hintText: 'user@example.com',
                            // helperText: 'supporting text',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisible,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  print('password');
                                  passwordVisible = !passwordVisible;
                                  setState(() {});
                                },
                                child: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility)),

                            labelText: 'Password',
                            hintText: '***********',

                            // helperText: 'supporting text',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          controller: confirmPassController,
                          obscureText: !passwordVisible,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (passwordController.text !=
                                confirmPassController.text) {
                              return 'Password doesnot match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  print('password');
                                  passwordVisible = !passwordVisible;
                                  setState(() {});
                                },
                                child: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility)),

                            labelText: 'Confirm Password',
                            hintText: '***********',

                            // helperText: 'supporting text',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var body = {
                                  "email": emailController.text,
                                  "firstName": firstNameController.text,
                                  "lastName": lastNameController.text,
                                  "password": passwordController.text,
                                };

                                final response =
                                    await NetworkCalls().registerUser(body);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(400, 50),
                              minimumSize: const Size(400, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 3, 90),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(7), // button's shape
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(400, 50),
                              minimumSize: const Size(400, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 3, 90),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(7), // button's shape
                              ),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
