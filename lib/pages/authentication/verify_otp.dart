import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/pages/authentication/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                      "Verify Your Email",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 3, 90)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: const Text(
                      "Please enter 6 digit code from your email",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Container(
                      height: 80,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        cursorHeight: 0,
                        cursorWidth: 0,
                        hintCharacter: '-',
                        hintStyle: TextStyle(color: whiteColor),
                        textStyle: TextStyle(color: whiteColor),
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            inactiveBorderWidth: 1,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            inactiveColor: bluePrimary,
                            inactiveFillColor: bluePrimary,
                            activeFillColor: bluePrimary,
                            activeColor: bluePrimary),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 200),
                        enableActiveFill: true,

                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        // backgroundColor: blueColor,
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

                          Get.offAll(() => LoginPage());

                          // if (_formKey.currentState!.validate()) {
                          //   Get.dialog(Dialog(
                          //     child: Container(
                          //       color: Colors.amber,
                          //     ),
                          //   ));
                          // }
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
