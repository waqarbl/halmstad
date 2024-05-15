import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/pages/authentication/home.dart';
import 'package:halmstad/pages/authentication/verify_otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        // width: double.maxFinite,
        // height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 350,
              color: const Color.fromARGB(255, 1, 3, 90),
              child: Center(
                  child: Container(
                      width: 260,
                      height: 130,
                      child: Image.asset('assets/halmstadLogo.png'))),
            ),
            Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 3, 90)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: const Text(
                      "Please enter you email address",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        labelText: 'Email',
                        hintText: 'user@example.com',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushReplacement(MaterialPageRoute(
                          //   builder: (context) => const HomePage(),
                          // ));

                          if (_formKey.currentState!.validate()) {
                            Get.to(() => VerifyOtp());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          maximumSize: const Size(400, 50),
                          minimumSize: const Size(400, 50),
                          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7), // button's shape
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
