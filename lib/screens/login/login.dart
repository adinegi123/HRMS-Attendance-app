import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/Local%20Database/local_database.dart';
import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/class/form%20validation.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_popup.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseMethods firebaseMethods = FirebaseMethods();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                collapsedHeight: MediaQuery.of(context).size.height * 0.25,
                backgroundColor: Colors.deepPurple,
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.25,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                )),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10.0),
                  child: Container(
                    height: 166,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorConst.deepPurpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Enter Your Credentials to Login",
                            style: TextStyle(color: Color(0xFFBDBDBD)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            SliverToBoxAdapter(
              child: Form(
                key: widget._formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        MyTextField(
                          hintText: "UserName",
                          prefixIcon: const Icon(Icons.person),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (s) {
                            return FormValidationFunction.checkEmailId(s);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<PasswordVisibilityProvider>(
                            builder: (context, value, child) {
                          return MyTextField(
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.lock),
                            controller: _passwordController,
                            obscureText: !value.passwordVisibility,
                            validator: (s) {
                              return FormValidationFunction.checkPassword(s,
                                  signUp: false, login: true);
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                value.togglePasswordVisibility(
                                    passwordVisible: !value.passwordVisibility,
                                    confirmPasswordVisible:
                                        value.confirmPasswordVisibility);
                              },
                              child: Icon(
                                value.passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: ColorConst.deepPurpleColor,
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        Buttons(
                          onTap: () async {
                            if (widget._formKey.currentState!.validate()) {
                              CustomPopup.showProgressIndicator(
                                  context: context);
                              UserCredential? userCredential =
                                  await firebaseMethods.logIn(
                                      _emailController.text,
                                      _passwordController.text,
                                      context);
                              if (context.mounted && userCredential != null) {
                                await LocalDb.setUserUID(
                                    userCredential.user!.uid);
                                log("userUID${userCredential.user!.uid}");
                                CustomPopup.dismissProgressIndicator();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    Routes.homePageRoute, (route) => false);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Logged in successfully"),
                                  duration: Duration(seconds: 2),
                                ));
                              } else {
                                CustomPopup.dismissProgressIndicator();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Failed to login"),
                                  duration: Duration(seconds: 2),
                                ));
                              }
                            }
                          },
                          buttonText: const Center(child: Text('Login')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Create new account !!',
                              style: TextStyle(color: Colors.grey.shade700),
                              children: [
                                TextSpan(
                                  text: ' Sign up',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, Routes.signUpPageRoute);
                                    },
                                )
                              ]),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
