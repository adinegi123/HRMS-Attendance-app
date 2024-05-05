import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/Local%20Database/local_database.dart';
import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/class/form%20validation.dart';
import 'package:attendance_app/class/utils.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/providers/location_service_provider.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

import '../../components/custom_popup.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPwController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    _mobileController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPwController.clear();
    _nameController.clear();
    _ageController.clear();
    _addressController.clear();
    _mobileController.clear();
    _designationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: widget._formKey,
        child: Scrollbar(
          thickness: 4,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  collapsedHeight: MediaQuery.of(context).size.height * 0.25,
                  backgroundColor: Colors.deepPurple,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                  ),
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
                        color: deepPurpleColor,
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
                              "Create an Account",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Please fill details below",
                              style: TextStyle(color: Color(0xFFBDBDBD)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      MyTextField(
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email),
                          validator: (s) {
                            if (s == null || s.isEmpty) {
                              return FormValidationFunction.checkIfEmpty(s);
                            }
                            if (!Utils.isEmail(s)) {
                              return 'Please enter valid Email id';
                            }
                            return null;
                          },
                          controller: _emailController),
                      MyTextField(
                        hintText: "Name",
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                        controller: _nameController,
                        validator: (s) {
                          return FormValidationFunction.checkIfEmpty(s);
                        },
                      ),
                      MyTextField(
                        hintText: "Mobile",
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.phone),
                        controller: _mobileController,
                        validator: (s) {
                          return FormValidationFunction.checkPhoneNumber(s);
                        },
                      ),
                      Consumer<PasswordVisibilityProvider>(
                          builder: (context, value, child) {
                        return Column(
                          children: [
                            MyTextField(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              controller: _passwordController,
                              obscureText: !value.passwordVisibility,
                              validator: (s) {
                                return FormValidationFunction.checkPassword(s,
                                    signUp: true, login: false);
                              },
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  value.togglePasswordVisibility(
                                    passwordVisible: !value.passwordVisibility,
                                    confirmPasswordVisible:
                                        value.confirmPasswordVisibility,
                                  );
                                },
                                child: Icon(
                                  value.passwordVisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: deepPurpleColor,
                                ),
                              ),
                            ),
                            MyTextField(
                                hintText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock),
                                obscureText: !value.confirmPasswordVisibility,
                                validator: (s) {
                                  if (s!.trim() !=
                                      _passwordController.text.trim()) {
                                    return 'Password not same';
                                  }
                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    value.togglePasswordVisibility(
                                      passwordVisible: value.passwordVisibility,
                                      confirmPasswordVisible:
                                          !value.confirmPasswordVisibility,
                                    );
                                  },
                                  child: Icon(
                                    value.confirmPasswordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: deepPurpleColor,
                                  ),
                                ),
                                controller: _confirmPwController)
                          ],
                        );
                      }),
                      MyTextField(
                        hintText: "Age",
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.person_sharp),
                        controller: _ageController,
                        validator: (s) {
                          return FormValidationFunction.checkAgeField(s);
                        },
                      ),
                      MyTextField(
                        hintText: "Address",
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        controller: _addressController,
                        validator: (s) {
                          return FormValidationFunction.checkIfEmpty(s);
                        },
                      ),
                      MyTextField(
                        hintText: "Designation",
                        prefixIcon: const Icon(Icons.account_circle),
                        controller: _designationController,
                        validator: (s) {
                          return FormValidationFunction.checkIfEmpty(s);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Buttons(
                          onTap: () async {
                            if (widget._formKey.currentState!.validate()) {
                              CustomPopup.showProgressIndicator(
                                  context: context);
                              LocationServiceProvider locationServiceProvider =
                                  Provider.of<LocationServiceProvider>(context,
                                      listen: false);
                              await locationServiceProvider.fetchData();
                              UserCredential? userCredential =
                                  await FirebaseMethods.signUp(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      context: context);
                              if (userCredential != null) {
                                log("userCredential$userCredential");
                                var userUid = userCredential.user?.uid;
                                log("userUid-->$userUid");
                                await LocalDb.setUserUID(userUid!);
                                var generator =
                                    RandomStringGenerator(fixedLength: 10);
                                var userProfileUid = generator.generate();
                                await LocalDb.setUserProfileUid(userProfileUid);
                                var res = await FirebaseMethods.createUser(
                                  userUid: userUid,
                                  userProfileUid: userProfileUid,
                                  userName: _nameController.text,
                                  userAge: _ageController.text,
                                  userAddress: _addressController.text,
                                  userEmail: _emailController.text,
                                  associatedCluster: 'ABC',
                                  profileImageURL: '',
                                  mobileNumber: _mobileController.text,
                                  countryCode: '+91',
                                  stateCode: '',
                                  latLong:
                                      '${locationServiceProvider.latitude},${locationServiceProvider.longitude}',
                                  localityCode: '',
                                  pinCode: '',
                                  password: _passwordController.text,
                                  ipAddress: locationServiceProvider.ipAddress,
                                  empDesignation: _designationController.text,
                                  appVersion: '',
                                  deviceType:
                                      locationServiceProvider.deviceName,
                                  // Assuming _deviceType is an enum value
                                  loginTimeStamp: '',
                                  logoutTimeStamp: '',
                                  floorCount: '2',
                                );
                                log("response $res");
                                if (res == true) {
                                  CustomPopup.dismissProgressIndicator();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.homePageRoute, (route) => false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Signed Up successfully!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Something went wrong'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              } else {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to Sign Up'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                clearControllers();
                              }
                            }
                          },
                          buttonText: const Center(child: Text('Sign up')),
                        ),
                      ),

                      // RichText(
                      //   text: TextSpan(
                      //       text: 'Already have account?',
                      //       style: TextStyle(color: Colors.grey.shade700),
                      //       children: [
                      //         TextSpan(
                      //           text: ' Login',
                      //           style:
                      //           const TextStyle(fontWeight: FontWeight.bold),
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = () {
                      //               Navigator.pushNamed(
                      //                   context, Routes.loginPageRoute);
                      //             },
                      //         )
                      //       ]),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
