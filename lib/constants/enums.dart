
enum DeviceType {
  android('Android'),
  ios('IOS');

  final String name;
  const DeviceType(this.name);
}
enum InternetConnectionStatus {
  idle,
  connected,
  disconnected,
}
enum CustomPopupType {
  loadingPopup,
  exitAppPopup,
  exitScreenPopup,
  deletePopup,
}
enum LocationServiceStatus { idle, enabled, disabled }