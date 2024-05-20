import 'dart:developer';
import 'dart:io';
import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/Local%20Database/local_database.dart';
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
  File? _profileImage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPwController.dispose();
    super.dispose();
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPwController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityProvider>(
        builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: SafeArea(
            child: Form(
              key: widget._formKey,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: _profileImage != null
                                  ? Image.file(_profileImage!).image
                                  : const AssetImage(
                                      "assets/images/profile_image.png"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: GestureDetector(
                                    onTap: () {
                                      //showImagePicker(context);
                                      CustomPopup.showImagePickerPopup(context: context);
                                    },
                                    child: const Icon(Icons.add)),
                              ),
                            )
                          ],
                        ),
                      ),

                      /*Center(
                        child: Stack(
                          children: [
                            const SizedBox(
                              width: 105,
                              height: 105,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: (value.userImage != null)
                                    ? DecorationImage(
                                  image: FileImage(
                                    File(value.userImage!.path),
                                  ),
                                  fit: BoxFit.cover,
                                )
                                    : null,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: -2,
                                    blurRadius: 20.0,
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: (value.userImage == null)
                                  ? const Icon(
                                Icons.person,
                                size: 60,
                              )
                                  : null,
                            ),
                            Positioned(
                              bottom: 5,
                              right: 3,
                              child: GestureDetector(
                                onTap: () {
                                  try {
                                    log("error");
                                    log("error in");
                                    showImagePicker(context);
                                  } catch (e) {
                                    log("Error selecting image: $e");
                                    // Handle error gracefully, e.g., show a snackbar
                                  }
                                  //showImagePicker(context);
                                  //CustomPopup.showImagePickerPopup(context: context);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.add)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/

                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: MyTextField(
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
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
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: MyTextField(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: MyTextField(
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
                                  child: Icon(value.confirmPasswordVisibility
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                controller: _confirmPwController),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Buttons(
                        onTap: () async {
                          if (widget._formKey.currentState!.validate()) {
                            CustomPopup.showProgressIndicator(context: context);
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
                                userName: '',
                                userAge: '',
                                userAddress: '',
                                userEmail: _emailController.text,
                                associatedCluster: 'ABC',
                                profileImageURL: '',
                                mobileNumber: '',
                                countryCode: '+91',
                                stateCode: '',
                                latLong:
                                    '${locationServiceProvider.latitude},${locationServiceProvider.longitude}',
                                localityCode: '',
                                pinCode: '',
                                password: _passwordController.text,
                                ipAddress: locationServiceProvider.ipAddress,
                                empDesignation: 'flutter developer',
                                appVersion: '',
                                deviceType: locationServiceProvider.deviceName,
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, Routes.loginPageRoute);
                                  },
                              )
                            ]),
                      ),
                    ]),
              ),
            ),
          ));
    });
  }
}
