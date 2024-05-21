import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:attendance_app/models/second_user_model.dart';
import 'package:attendance_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class FirebaseMethods {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserCredential?> signUp({required String email,
    required String password,
    required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('user signed up');
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

  Future<UserCredential?> logIn(String email, String password,
      BuildContext context) async {
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
      log('user signed out');
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

  static Future<void> sendErrorLog(
      {required Object error, required StackTrace stackTrace}) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    try {
      // Get the current user ID from Firebase Authentication
      String? userId = await getUserId();

      // Record the error in Firebase Crashlytics
      // await FirebaseCrashlytics.instance.recordError(error, stackTrace);

      // Send the error log to your API
      var res = await http.post(
        Uri.parse('your_api_endpoint_here'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'stackTrace': stackTrace.toString(),
          'errorCode': error.toString(),
          'userId': userId ?? 'Unknown',
        }),
      );

      if (res.statusCode == 200) {
        log('Log Sent');
      } else {
        log('Log Not Sent');
      }
    } catch (e) {
      log('Error sending error log: $e');
    }
  }

  static Future<String?> getUserId() async {
    try {
      // Get the current user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      // Check if the user is signed in
      if (user != null) {
        // User is signed in, return the user's UID (user ID)
        return user.uid;
      } else {
        // User is not signed in, return null or handle accordingly
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the process
      log('Error retrieving user ID: $e');
      return null;
    }
  }

  static Future<bool> createUser({
    required bool isRegistered,
    required String userName,
    required String? userUId,
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
    required String? operatingSystem,
    required DateTime? loginTimeStamp,
    required String? logoutTimeStamp,
    required String? floorCount,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userUId).set({});

      await FirebaseFirestore.instance.collection('users').doc(userUId).set({
        'isRegistered': isRegistered,
        'userUid': userUId,
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
        'userAddress': userAddress,
        'operatingSystem': operatingSystem,
        'empDesignation': empDesignation,
        'appVersion': appVersion,
        'deviceType': deviceType?.toString(),
        'loginDateTime': loginTimeStamp,
        'logoutDateTime': logoutTimeStamp,
        'floorCount': floorCount,
        'timestamp': FieldValue.serverTimestamp(),
      });
      log('user collection created');
      return true;
    } catch (e) {
      log('Error creating user: $e');
      return false;
    }
  }

  static Future<String> uploadImage(File imageFile) async {
    try {
      // Get the file name
      String fileName = basename(imageFile.path);

      // Reference to the location where you want to upload the image
      Reference storageReference = FirebaseStorage.instance.ref().child(
          'images/$fileName');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(imageFile);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Get the download URL for the uploaded image
      String downloadURL = await snapshot.ref.getDownloadURL();

      // Return the download URL
      return downloadURL;
    } catch (e) {
      // Error handling
      log('Error uploading image: $e');
      return '';
    }
  }


  static Future<UserDataModel?> getUserProfile(
      {required String? userUid}) async {
    try {
      log("userUID $userUid");
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('myProfile')
          .orderBy('timestamp', descending: true)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        log("userData $userData");
        UserDataModel userDataModelModel = UserDataModel.fromJson(userData);
        log("userModel $userDataModelModel");
        return userDataModelModel;
      } else {
        log("No documents found for user profile");
        return null;
      }
    } catch (e) {
      log('Error getting user profile: $e');
      return null;
    }
  }
}