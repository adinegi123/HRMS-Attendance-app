import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/screens/home/homepage.dart';
import 'package:attendance_app/screens/signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Enter Your Credentials to Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: MyTextField(
                  hintText: "UserName",
                  prefixIcon: Icons.person,
                  obsecureText: false,
                  controller: _userName),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: MyTextField(
                  hintText: "Password",
                  prefixIcon: Icons.password,
                  obsecureText: true,
                  controller: _passwordController),
            ),
            const SizedBox(
              height: 50,
            ),
            Buttons(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                "Login",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: 'Create new account !!',
                  style: TextStyle(color: Colors.grey.shade700),
                  children: [
                    TextSpan(
                      text: ' Sign up',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                    )
                  ]),
            ),
          ]),
        ));
  }
}
