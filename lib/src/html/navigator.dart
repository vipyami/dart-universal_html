part of universal_html;

// ------------------------------------------
// Only essential APIs have been implemented.
// ------------------------------------------

class Navigator {
  final Permissions permission = new Permissions._();

  /// IMPORTANT: Not part of 'dart:html' API.
  @visibleForTesting
  Navigator.constructor();

  factory Navigator._() => HtmlDriver.current.newNavigator();

  String get appName => "";

  String get appVersion => "";

  int get deviceMemory => null;

  Geolocation get geoLocation => null;

  String get language {
    final languages = this.languages;
    return languages.isEmpty ? null : languages.first;
  }

  List<String> get languages => const ["en-US"];

  MediaDevices get mediaDevices => MediaDevices._();

  bool get onLine => false;

  String get userAgent => "";

  String get vendor => "";

  String get vendorSub => "";

  void cancelKeyboardLock() {}

  Future<RelatedApplication> getInstalledRelatedApps() {
    return Future.error(UnimplementedError());
  }

  Future<MediaStream> getUserMedia(
      {dynamic audio: false, dynamic video: false}) {
    return Future.error(UnimplementedError());
  }

  void registerProtocolHandler(String scheme, String url, String title) {}

  Future requestKeyboardLock([List<String> keyCodes]) {
    return Future.error(UnimplementedError());
  }

  Future requestMediaKeySystemAccess(
      String keySystem, List<Map> supportedConfigurations) {
    return Future.error(UnimplementedError());
  }

  bool sendBeacon(String url, Object data) {
    return false;
  }
}

class RelatedApplication {
  final String id;
  final String platform;
  final String url;

  RelatedApplication._({this.id, this.platform, this.url});
}
