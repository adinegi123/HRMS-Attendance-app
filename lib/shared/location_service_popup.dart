import 'dart:async';

import 'package:attendance_app/components/responsive_progress_indicator.dart';
import 'package:attendance_app/components/secondary_custom_button.dart';
import 'package:attendance_app/providers/essential_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LocationServicePopup extends StatefulWidget {
  const LocationServicePopup({super.key});

  @override
  State<LocationServicePopup> createState() => _LocationServicePopupState();
}

class _LocationServicePopupState extends State<LocationServicePopup> {
  final Stream<ServiceStatus> systemLocationServiceStream =
  Geolocator.getServiceStatusStream();
  late StreamSubscription<ServiceStatus> locationServiceSubscription;

  @override
  void initState() {
    super.initState();
    locationServiceSubscription = systemLocationServiceStream.listen((event) {
      if (event == ServiceStatus.enabled) {
        var essentialProvider =
        Provider.of<EssentialServiceProvider>(context, listen: false);
        essentialProvider.updateLocationServiceStatus(
            locationServiceStatus: true);
        essentialProvider.updatePopupStatus(popupStatus: false);
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    locationServiceSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child:
                LottieBuilder.asset('assets/animations/no_internet.json'),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Device Location Service\nis disabled',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    KCustomButton(
                      buttonText: 'Connecting Location Service',
                      iconChild:
                      ResponsiveProgressIndicator(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
