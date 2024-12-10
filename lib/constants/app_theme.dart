import 'package:flutter/material.dart';

import '../utils/navigation_service.dart';

bool isDarkMode() {
  if (Theme.of(NavigationService.navigatorKey.currentState!.context).brightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}

Color setColor({required Color light, required Color dark}) {
  if (Theme.of(NavigationService.navigatorKey.currentState!.context).brightness == Brightness.dark) {
    return dark;
  } else {
    return light;
  }
}

TextTheme textTheme() {
  return Theme.of(NavigationService.navigatorKey.currentState!.context).textTheme;
}
