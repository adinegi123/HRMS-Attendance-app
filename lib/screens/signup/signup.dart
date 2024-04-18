
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/screens/home/homepage.dart';
import 'package:attendance_app/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Create Your Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: MyTextField(
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      obsecureText: false,
                      controller: _emailcontroller),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: MyTextField(
                      hintText: "Password",
                      prefixIcon: Icons.password,
                      obsecureText: true,
                      controller: _passwordController),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: MyTextField(
                      hintText: "Confirm Password",
                      prefixIcon: Icons.password,
                      obsecureText: true,
                      controller: _confirmPwController),
                ),
                const SizedBox(height: 50,),
                Buttons(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                }, child: const Text("Sign Up", textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),),
                const SizedBox(height: 20,),
                RichText(
                  text: TextSpan(
                      text: 'Already have account?',style: TextStyle(
                      color: Colors.grey.shade700
                  ),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                            },
                        )
                      ]),
                ),
              ]
          ),)
    );
  }
}
