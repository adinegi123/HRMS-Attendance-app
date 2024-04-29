import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseMethods {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserCredential?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (error) {
      String errorMessage = 'An error occurred';

      switch (error.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use.';
          break;
        default:
          errorMessage = 'An error occurred: ${error.message}';
      }
      log("errorMessage$errorMessage");

      return null;
    }
  }

  Future<UserCredential?> logIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      if (error is FirebaseAuthException) {
        String errorMessage = 'An error occurred';

        switch (error.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided for that user.';
            break;
          default:
            errorMessage = 'An error occurred: ${error.message}';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected error: $error'),
          ),
        );
      }
      return null;
    }
  }

  static Future<bool> resetPassword(String email, BuildContext context) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        String errorMessage = 'An error occurred';
        switch (error.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          default:
            errorMessage = 'An error occurred: ${error.message}';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected error: $error'),
          ),
        );
      }
      return false;
    }
  }

  static Future<bool> signOut(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<bool> isUserSignedIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final User? user = auth.currentUser;
      return user != null;
    } catch (error) {
      log('Error checking user sign-in status: $error');
      return false;
    }
  }

  static Future<bool> createUser({
    required String userName,
    required String? userUid,
    required String? userProfileUid,
    required String? userAge,
    required String? userAddress,
    required String? userEmail,
    required String? associatedCluster,
    required String? profileImageURL,
    required String? mobileNumber,
    required String? countryCode,
    required String? stateCode,
    required String? latLong,
    required String? localityCode,
    required String? pinCode,
    required String? password,
    required String? ipAddress,
    required String? empDesignation,
    required String? appVersion,
    required String? deviceType,
    required String? loginTimeStamp,
    required String? logoutTimeStamp,
    required String? floorCount,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userUid).set({});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('myProfile')
          .doc(userProfileUid)
          .set({
        'userUid': userUid,
        'userProfileUid': userProfileUid,
        'userName': userName,
        'userAge': userAge,
        'userAddress': userAddress,
        'userEmail': userEmail,
        'associatedCluster': associatedCluster,
        'profileImageURL': profileImageURL,
        'mobileNumber': mobileNumber,
        'countryCode': countryCode,
        'stateCode': stateCode,
        'latLong': latLong,
        'localityCode': localityCode,
        'pinCode': pinCode,
        'password': password,
        'ipAddress': ipAddress,
        'empDesignation': empDesignation,
        'appVersion': appVersion,
        'deviceType': deviceType?.toString(), // Convert enum to string if not null
        'loginTimeStamp': loginTimeStamp,
        'logoutTimeStamp': logoutTimeStamp,
        'floorCount': floorCount,
        'timestamp': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      log('Error creating user: $e');
      return false;
    }
  }
}


