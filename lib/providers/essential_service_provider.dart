import 'package:attendance_app/constants/enums.dart';
import 'package:flutter/foundation.dart';

class EssentialServiceProvider with ChangeNotifier {
  bool isPopupMounted = false;
  InternetConnectionStatus _connectionStatus = InternetConnectionStatus.idle;
  InternetConnectionStatus get connectionStatus => _connectionStatus;
  LocationServiceStatus _locationServiceStatus = LocationServiceStatus.disabled;
  LocationServiceStatus get locationServiceStatus => _locationServiceStatus;

  void updateConnectionStatus({required bool internetStatus}) {
    _connectionStatus = internetStatus
        ? InternetConnectionStatus.connected
        : InternetConnectionStatus.disconnected;
    notifyListeners();
  }

  void updateLocationServiceStatus({required bool locationServiceStatus}) {
    _locationServiceStatus = locationServiceStatus
        ? LocationServiceStatus.enabled
        : LocationServiceStatus.disabled;
    notifyListeners();
  }

  void updatePopupStatus({required bool popupStatus}) {
    isPopupMounted = popupStatus;
    notifyListeners();
  }
}
