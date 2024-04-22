import 'package:attendance_app/class/form%20validation.dart';
import 'package:attendance_app/class/utils.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key,
    required GlobalKey<FormState> formKey,}): _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPwController.dispose();
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
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create Your Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: MyTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      validator: (s) {
                        if (s == null || s.isEmpty) {
                          return null;
                        }
                        if (!Utils.isEmail(s)) {
                          return 'Please enter valid Email id';
                        }
                        return null;
                      },
                      controller: _emailController),
                ),
                const SizedBox(
                  height: 20,
                ),

                // password provider
                Consumer<PasswordVisibilityProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: MyTextField(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              controller: _passwordController,
                              obscureText: !value.passwordVisibility,
                              validator: (s) {
                                return FormValidationFunction.checkPassword(s, signUp: true, login: false);
                              },
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  value.togglePasswordVisibility(
                                    passwordVisible: !value.passwordVisibility,
                                    confirmPasswordVisible: value.confirmPasswordVisibility,);
                                },
                                child: Icon(value.passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28.0),
                            child: MyTextField(
                                hintText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock),
                                obscureText: !value.confirmPasswordVisibility,
                                validator: (s) {
                                  if (s!.trim() != _passwordController.text.trim()) {
                                    return 'Password not same';
                                  }
                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    value.togglePasswordVisibility(
                                      passwordVisible: value.passwordVisibility,
                                      confirmPasswordVisible: !value.confirmPasswordVisibility,
                                    );
                                  },
                                  child: Icon(value.confirmPasswordVisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                controller: _confirmPwController),
                          )
                        ],
                      );
                    }),
                const SizedBox(
                  height: 50,
                ),
                Buttons(
                  onTap: () {
                    if (widget._formKey.currentState!.validate()){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Registration Successful"),
                            content: const Text("User successfully register, Go to login page"),
                            actions:[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(context, Routes.loginPageRoute);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                      _emailController.clear();
                      _passwordController.clear();
                      _confirmPwController.clear();
                    }
                  },
                  buttonText: 'Sign up',
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Already have account?',
                      style: TextStyle(color: Colors.grey.shade700),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, Routes.loginPageRoute);
                            },
                        )
                      ]),
                ),
              ]),
            ),
          ),
        ));
  }
}