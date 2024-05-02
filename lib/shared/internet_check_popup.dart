import 'dart:developer';

import 'package:attendance_app/components/responsive_progress_indicator.dart';
import 'package:attendance_app/components/secondary_custom_button.dart';
import 'package:attendance_app/providers/essential_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InternetCheckPopup extends StatefulWidget {
  const InternetCheckPopup({super.key, required this.dialogKey});

  final GlobalKey dialogKey;

  @override
  State<InternetCheckPopup> createState() => _InternetCheckPopupState();
}

class _InternetCheckPopupState extends State<InternetCheckPopup> {
  final FlutterNetworkConnectivity flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    lookUpDuration: const Duration(seconds: 5),
    lookUpUrl: 'google.com',
  );

  @override
  void initState() {
    super.initState();
    flutterNetworkConnectivity
        .getInternetAvailabilityStream()
        .listen((isInternetAvailable) {
      log('Internet Popup Status => $isInternetAvailable');
      var essentialProvider =
          Provider.of<EssentialServiceProvider>(context, listen: false);
      if (isInternetAvailable) {
        essentialProvider.updateConnectionStatus(internetStatus: true);
        essentialProvider.updatePopupStatus(popupStatus: false);
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    flutterNetworkConnectivity.unregisterAvailabilityListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        key: widget.dialogKey,
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
                      'Device not connected\nwith Internet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    KCustomButton(
                      buttonText: 'Connecting Server',
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
