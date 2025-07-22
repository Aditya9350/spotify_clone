
import 'package:flutter/cupertino.dart';

import '../../splash_screen/splash_screen.dart';


class AppRoutes{
  static const String splash_page = '/splash';
  static const String intro_page = '/intro';


 static Map<String,Widget Function(BuildContext)> getRoutes() => {
   splash_page : (context) => const SplashScreen()
  };

}