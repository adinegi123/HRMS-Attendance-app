
import 'package:attendance_app/class/form%20validation.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({super.key,
    required GlobalKey<FormState> formKey,}): _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userName.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Form(
            key: widget._formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Enter Your Credentials to Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: MyTextField(
                        hintText: "UserName",
                        prefixIcon: const Icon(Icons.person),
                        controller: _userName,
                        validator: (s) {
                          return FormValidationFunction.checkEmailId(s);
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Consumer<PasswordVisibilityProvider>(
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: MyTextField(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              controller: _passwordController,
                              obscureText: !value.passwordVisibility,
                              validator: (s) {
                                return FormValidationFunction.checkPassword(s, signUp: false, login: true);
                              },
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  value.togglePasswordVisibility(
                                      passwordVisible: !value.passwordVisibility,
                                      confirmPasswordVisible: value.confirmPasswordVisibility
                                  );
                                },
                                child: Icon(value.passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 50,),
                    Buttons(onTap: () {
                      if (widget._formKey.currentState!.validate()){
                        Navigator.pushNamed(context, Routes.homePageRoute);
                        // _userName.clear();
                        // _passwordController.clear();
                      }
                    },
                      buttonText: 'Login',),
                    const SizedBox(height: 10,),
                    RichText(
                      text: TextSpan(
                          text: 'Create new account !!',style: TextStyle(
                          color: Colors.grey.shade700
                      ),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Routes.signUpPageRoute);
                                },
                            )
                          ]),
                    ),
                  ]
              ),
            ),
          ),)
    );
  }
}
