import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screen/login_screen.dart';
import 'utils/navigation_service.dart';

String shopId = '';
bool isWebView = kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogin = false;
  // try {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLogin = prefs.getBool(SpKeys.isLogin) ?? false;
  //   shopId = prefs.getString(SpKeys.shopId) ?? '';
  // } catch (e) {
  //   print('shared prefs: $e');
  // }
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = 1440;
    double deviceHeight = 1024;
    return ScreenUtilInit(
      // designSize: Size(deviceWidth, deviceHeight),
      child: MaterialApp(
        builder: (context, widget) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
            child: ResponsiveBreakpoints.builder(
              child: widget!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K')
              ],
            ),
          );
        },
        navigatorKey: NavigationService.navigatorKey,
        home: LoginScreen(),
        // HomeScreen(),

        // isLogin ? HomeScreen() : LoginScreen(),
      ),
    );
  }
}
