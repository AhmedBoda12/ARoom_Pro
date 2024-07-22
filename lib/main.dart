import 'dart:developer';

import 'package:aroom_pro/core/utils/constants.dart';
import 'package:aroom_pro/routes.dart';
import 'package:aroom_pro/Features/auth/presentation/views/auth_page.dart';
import 'package:aroom_pro/Features/dashboard/presentation/views/dashboard_page.dart';
import 'package:aroom_pro/Features/home/presentation/views/intial_page.dart';
import 'package:aroom_pro/core/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ARoomProApp());
}

class ARoomProApp extends StatelessWidget {
  const ARoomProApp({super.key});

  static const MaterialColor internationalOrange = MaterialColor(
    0xfff15c22, // Default color (500)
    kColorPalteMap,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARoom Pro',
      theme: ThemeData(
        primarySwatch: internationalOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xfff15c22),
          primary: internationalOrange[500],
          secondary: internationalOrange[300],
          error: Colors.red,
          onPrimary: Colors.white,
        ),
        textTheme: GoogleFonts.readexProTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            FlutterNativeSplash.remove();
            final user = snapshot.data;
            return FutureBuilder(
                future: getUserRole(user!.uid),
                builder: (context, roleSnapshot) {
                  String? role = roleSnapshot.data;
                  if (roleSnapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(body: LoadingWidget());
                  }
                  if (roleSnapshot.hasData) {
                    if (role == 'Admin') {
                      return const DashboardPage();
                    }
                  }
                  return const IntialPage();
                });
          }
          FlutterNativeSplash.remove();
          return const AuthPage();
        },
      ),
      routes: appRoutes,
    );
  }

  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      return doc['role'];
    } catch (e) {
      log('Error fetching user role: $e');
      return null;
    }
  }
}
