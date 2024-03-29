import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:halmstad/pages/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              child: const Center(
                child: Text(
                  "Logo Here",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
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
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Email',
                          hintText: 'user@example.com',
                          // helperText: 'supporting text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: const TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: '***********',

                          // helperText: 'supporting text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
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
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: RichText(
                        textDirection: TextDirection.ltr,
                        text: const TextSpan(
                          text: 'Forgot Password ? ',
                          style: TextStyle(color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Contact Your Admin',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
