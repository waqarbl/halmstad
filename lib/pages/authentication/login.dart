import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/controllers/local_storage.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/pages/authentication/forgot_password.dart';
import 'package:halmstad/pages/authentication/home.dart';
import 'package:halmstad/pages/authentication/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 30),
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
                          "Please login to your account",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    isLoading = true;
                                    setState(() {});
                                    if (_formKey.currentState!.validate()) {
                                      // Get.off(() => HomePage());
                                      var body = {
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                      };

                                      final response =
                                          await NetworkCalls().loginUser(body);

                                      print(response);
                                      final decodedRes = jsonDecode(response);
                                      print(
                                          'Token :::::: ${decodedRes['user']['token']}');

                                      String tokenFromres =
                                          decodedRes['user']['token'];

                                      if (!response.contains('Error:')) {
                                        await LocalStorage()
                                            .saveToken(tokenFromres);

                                        final newToken =
                                            await LocalStorage().getToken();
                                        print(newToken);
                                        isLoading = false;
                                        setState(() {});

                                        Get.to(() => HomePage());
                                      }
                                      isLoading = false;
                                      setState(() {});
                                      // if(jsonDecode(response))
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    maximumSize: const Size(400, 50),
                                    minimumSize: const Size(400, 50),
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 3, 90),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          7), // button's shape
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                      GestureDetector(
                        onTap: () {
                          print('Forgot Password');
                          Get.to(() => ForgotPassword());
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 50,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            // textDirection: TextDirection.ltr,
                            text: const TextSpan(
                              text: 'Forgot Password ? ',
                              style: TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                // TextSpan(
                                //     text: 'Contact Your Admin',
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         color: Colors.blue)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => RegisterPage());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    maximumSize: const Size(400, 50),
                                    minimumSize: const Size(400, 50),
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 3, 90),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          7), // button's shape
                                    ),
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
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
