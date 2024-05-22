import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinapp/routes/pageRoute.dart';
import 'package:skinapp/screens/AboutDiseases/aboutdiseases.dart';
import 'package:skinapp/screens/Aboutus/aboutcreaters.dart';
import 'package:skinapp/screens/Auth/Login.dart';
import 'package:skinapp/screens/Auth/SignUpScreen.dart';
import 'package:skinapp/screens/DoandDont/Doees.dart';
import 'package:skinapp/screens/Introduction/intro.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 0, 174),
      ),
      home: const Intro(),
      routes: {
        PageRoutes.signIn: (context) => const SignInPage(),
        PageRoutes.signup: (context) => const SignUpScreen(),
        PageRoutes.home: (context) => const SignInPage(),
        PageRoutes.dodont: (context) => const Dos(),
        PageRoutes.intro: (context) => const Intro(),
        PageRoutes.aboutdis: (context) => const AboutDisease(),
        PageRoutes.aboutus: (context) => AboutUs(uid: user?.uid),
      },
    );
  }
}
