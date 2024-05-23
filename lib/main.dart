import 'package:aroom_pro/firebase_options.dart';
import 'package:aroom_pro/helper/constants.dart';
import 'package:aroom_pro/views/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
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
        ),
        textTheme: GoogleFonts.readexProTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      initialRoute: AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
      },
    );
  }
}
