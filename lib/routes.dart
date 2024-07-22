import 'package:aroom_pro/Features/auth/presentation/views/auth_page.dart';
import 'package:aroom_pro/Features/home/presentation/views/intial_page.dart';
import 'package:aroom_pro/Features/user_profile/presentation/views/user_profile_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {
    AuthPage.routeName: (context) => const AuthPage(),
    IntialPage.routeName: (context) => const IntialPage(),
    UserProfilePage.routeName: (context) => const UserProfilePage(),
  };
}
