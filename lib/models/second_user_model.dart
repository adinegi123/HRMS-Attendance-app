import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userUid;
  final String userProfileUid;
  final bool isRegistered;
  final String userName;
  final int? userAge;
  final String state;
  final String userProfileLink;
  final String? userPdfLink;
  final Timestamp timestamp;

  const UserModel({
    required this.userUid,
    required this.userProfileUid,
    required this.isRegistered,
    required this.userName,
    required this.userAge,
    required this.state,
    required this.userProfileLink,
    required this.userPdfLink,
    required this.timestamp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userUid: json['userUid'],
      userProfileUid: json['userProfileUid'],
      isRegistered: json['isRegistered'],
      userName: json['userName'] ?? "",
      userAge: json['userAge'],
      state: json['state'] ?? "",
      userProfileLink: json['userProfileLink'] ?? "",
      userPdfLink: json['userPdfLink'] ?? "",
      timestamp: json['timestamp'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userUid': userUid,
      'userProfileUid': userProfileUid,
      'isRegistered': userProfileUid,
      'userName': userName,
      'userAge': userAge,
      'state': state,
      'userProfileLink': userProfileLink,
      'userPdfLink': userPdfLink,
      'timestamp': timestamp,
    };
  }

  @override
  List<Object?> get props => [
        userUid,
        userProfileUid,
        isRegistered,
        userName,
        userAge,
        state,
        userProfileLink,
        userPdfLink,
        timestamp,
      ];
}
