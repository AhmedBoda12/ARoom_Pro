import 'package:aroom_pro/helper/constants.dart';
import 'package:aroom_pro/views/auth_page.dart';
import 'package:aroom_pro/views/home_page.dart';
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
            return const HomePage();
          }
          FlutterNativeSplash.remove();
          return const AuthPage();
        },
      ),
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
