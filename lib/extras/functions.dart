import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Functions {
  static bool isMobile() {
    return Platform.isIOS || Platform.isAndroid;
  }

  static bool isTablet(BuildContext context) {
    // Assuming a tablet is a device with a screen width of at least 600 pixels
    return MediaQuery.of(context).size.width >= 600;
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isTabletOrWeb(BuildContext context) {
    return isTablet(context) || kIsWeb;
  }
}
