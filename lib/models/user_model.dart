
import 'package:equatable/equatable.dart';

enum DeviceType { android, ios, other }

class User extends Equatable {
  final int id;
  final String name;
  final String associatedCluster;
  final String profileImageURL;
  final String mobileNumber;
  final String countryCode;
  final String stateCode;
  final String latLong;
  final String localityCode;
  final String pinCode;
  final String emailID;
  final String password;
  final String ipAddress;
  final String empDesignation;
  final String appVersion;
  final DeviceType deviceType;
  final String loginTimeStamp;
  final String logoutTimeStamp;
  final String floorCount;

  const User({
    required this.id,
    required this.name,
    required this.associatedCluster,
    required this.profileImageURL,
    required this.mobileNumber,
    required this.countryCode,
    required this.stateCode,
    required this.latLong,
    required this.localityCode,
    required this.pinCode,
    required this.emailID,
    required this.password,
    required this.ipAddress,
    required this.empDesignation,
    required this.appVersion,
    required this.deviceType,
    required this.loginTimeStamp,
    required this.logoutTimeStamp,
    required this.floorCount,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    associatedCluster,
    profileImageURL,
    mobileNumber,
    countryCode,
    stateCode,
    latLong,
    localityCode,
    pinCode,
    emailID,
    password,
    ipAddress,
    empDesignation,
    appVersion,
    deviceType,
    loginTimeStamp,
    logoutTimeStamp,
    floorCount,
  ];
}