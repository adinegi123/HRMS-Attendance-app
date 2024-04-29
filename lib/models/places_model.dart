import 'package:equatable/equatable.dart';
class Place extends Equatable {
  final double latitude;
  final double longitude;
  final String address;
  final String name;
  final String clusterName;
  final String uid;
  final String imageUrl;
  final String buildingCount;

  final String openingHours;
  final String closingHours;
  final double ratingsAboutPlace;
  final double placeSize;
  final String totalNumberOfFloors;

  const Place({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.name,
    required this.clusterName,
    required this.uid,
    required this.imageUrl,
    required this.buildingCount,
    required this.openingHours,
    required this.closingHours,
    required this.ratingsAboutPlace,
    required this.placeSize,
    required this.totalNumberOfFloors,
  });

  @override
  List<Object?> get props => [
    latitude,
    longitude,
    address,
    name,
    clusterName,
    uid,
    imageUrl,
    buildingCount,
    openingHours,
    closingHours,
    ratingsAboutPlace,
    placeSize,
    totalNumberOfFloors,
  ];

  @override
  bool get stringify => true; // Enable toString() for debugging
}