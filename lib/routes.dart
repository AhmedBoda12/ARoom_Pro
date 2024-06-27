import 'package:aroom_pro/views/auth_page.dart';
import 'package:aroom_pro/views/intial_page.dart';
import 'package:aroom_pro/views/user_profile_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    AuthPage.routeName: (context) => const AuthPage(),
    IntialPage.routeName: (context) => const IntialPage(),
    UserProfilePage.routeName: (context) => const UserProfilePage(),
  };
}
