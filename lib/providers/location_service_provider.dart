import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
// import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class LocationServiceProvider with ChangeNotifier {
  // Location location = Location();
  Geolocator geolocator = Geolocator();

  String? ipAddress;
  String? operatingSystem;
  String? deviceId;
  String? deviceName;
  String? osVersion;
  String? deviceModel;
  String? latitude;
  String? longitude;

  Future<void> fetchData() async {
    // await getLocationData();
    await fetchDeviceInfo();
    await _getIpAddress();
    notifyListeners();
  }

  // Future<void> getLocationData() async {
  //   try {
  //     LocationData locationData = await location.getLocation();
  //     // Access latitude and longitude using locationData.latitude and locationData.longitude
  //      latitude = locationData.latitude!.toString();
  //      longitude = locationData.longitude!.toString();
  //     log('Latitude: $latitude, Longitude: $longitude');
  //     notifyListeners();
  //   } catch (e) {
  //     log('Error getting location data: $e');
  //   }
  // }


  Future<void> fetchDeviceInfo() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        ipAddress = await _getIpAddress();
        operatingSystem = 'Android';
        deviceId = androidInfo.id ?? 'N/A'; // Use 'N/A' if androidId is null
        deviceName = androidInfo.model ?? 'Unknown'; // Use 'Unknown' if model is null
        osVersion = androidInfo.version.release ?? 'Unknown'; // Use 'Unknown' if release version is null
        deviceModel = androidInfo.product ?? 'Unknown'; // Use 'Unknown' if product is null
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        ipAddress = await _getIpAddress();
        operatingSystem = 'iOS';
        deviceId = iosInfo.identifierForVendor ?? 'N/A'; // Use 'N/A' if identifierForVendor is null
        deviceName = iosInfo.name ?? 'Unknown'; // Use 'Unknown' if name is null
        osVersion = iosInfo.systemVersion ?? 'Unknown'; // Use 'Unknown' if systemVersion is null
        deviceModel = iosInfo.model ?? 'Unknown'; // Use 'Unknown' if model is null
      }
      notifyListeners();
    } catch (e) {
      log('Error fetching device info: $e');
    }
  }

  Future<String?> _getIpAddress() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;
        return decoded['ip'] as String?;
      } else {
        log('Error fetching IP address: ${response.statusCode}');
        return ''; // Return empty string if fetching IP fails
      }
    } catch (e) {
      log('Error fetching IP address: $e');
      return ''; // Return empty string if fetching IP fails
    }
  }
}
