import 'package:equatable/equatable.dart';

enum DeviceType { iOS, Android }

class UserDataModel extends Equatable {
  final bool isRegistered;
  final String? userUId;
  final int? userProfileUid;
  final String? userName;
  final String? userAge;
  final String? associatedCluster;
  final String? profileImageURL;
  final String? mobileNumber;
  final String? countryCode;
  final String? stateCode;
  final String? latLong;
  final String? localityCode;
  final String? pinCode;
  final String? userEmail;
  final String? password;
  final String? ipAddress;
  final String? userAddress;
  final String? empDesignation;
  final String? appVersion;
  final String? operatingSystem;
  final String? deviceType;
  final String? timestamp;
  final String? loginTimeStamp;
  final String? logoutTimeStamp;
  final String? floorCount;
  final DateTime? updatedAt;

  const UserDataModel({
    required this.isRegistered,
    required this.userUId,
    required this.userProfileUid,
    required this.userName,
    required this.userAge,
    required this.associatedCluster,
    required this.profileImageURL,
    required this.mobileNumber,
    required this.countryCode,
    required this.stateCode,
    required this.latLong,
    required this.localityCode,
    required this.pinCode,
    required this.userEmail,
    required this.password,
    required this.ipAddress,
    required this.userAddress,
    required this.empDesignation,
    required this.appVersion,
    required this.operatingSystem,
    required this.deviceType,
    required this.timestamp,
    required this.loginTimeStamp,
    required this.logoutTimeStamp,
    required this.floorCount,
    this.updatedAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      isRegistered: json['isRegistered'],
      userUId: json['userUId'],
      userProfileUid: json['userProfileUid'],
      userName: json['userName'],
      userAge: json['userAge'],
      associatedCluster: json['associatedCluster'] ?? "NA",
      profileImageURL: json['profileImageURL'] ?? "NA",
      mobileNumber: json['mobileNumber'],
      countryCode: json['countryCode'],
      stateCode: json['stateCode'],
      latLong: json['latLong'],
      localityCode: json['localityCode'] ?? "NA",
      pinCode: json['pinCode'],
      userEmail: json['userEmail'],
      password: json['password'],
      ipAddress: json['ipAddress'] ?? "NA",
      userAddress: json['userAddress'] ?? "NA",
      empDesignation: json['empDesignation'] ?? "NA",
      appVersion: json['appVersion'] ?? "NA",
      operatingSystem: json['operatingSystem'] ?? "NA",
      deviceType: json['deviceType'] ?? "NA",
      timestamp: json['timestamp'],
      loginTimeStamp: json['loginTimeStamp'] ?? "NA",
      logoutTimeStamp: json['logoutTimeStamp'] ?? "NA",
      floorCount: json['floorCount'] ?? "NA",
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isRegistered,': isRegistered,
      'userUId': userUId,
      'userProfileUid': userProfileUid,
      'userName': userName,
      'userAge': userAge,
      'associatedCluster': associatedCluster,
      'profileImageURL': profileImageURL,
      'mobileNumber': mobileNumber,
      'countryCode': countryCode,
      'stateCode': stateCode,
      'latLong': latLong,
      'localityCode': localityCode,
      'pinCode': pinCode,
      'userEmail': userEmail,
      'password': password,
      'ipAddress': ipAddress,
      'userAddress': userAddress,
      'empDesignation': empDesignation,
      'appVersion': appVersion,
      'operatingSystem': operatingSystem,
      'deviceType': deviceType,
      'timestamp': timestamp,
      'loginTimeStamp': loginTimeStamp,
      'logoutTimeStamp': logoutTimeStamp,
      'floorCount': floorCount,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        isRegistered,
        userUId,
        userProfileUid,
        userName,
        userAge,
        associatedCluster,
        profileImageURL,
        mobileNumber,
        countryCode,
        stateCode,
        latLong,
        localityCode,
        pinCode,
        userEmail,
        password,
        ipAddress,
        userAddress,
        empDesignation,
        appVersion,
        operatingSystem,
        deviceType,
        timestamp,
        loginTimeStamp,
        logoutTimeStamp,
        floorCount,
        updatedAt,
      ];
}
