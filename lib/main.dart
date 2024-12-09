import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:firebase_authentication/features/app/splash_screen/splash_screen.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/home_page.dart';
import 'package:firebase_authentication/global/login_page.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCoPkwFiLtj3NZ2i4gTmGt2K0S38jptBY8',
        appId: '1:614338180587:web:114bacbbbffb656aced5ae',
        messagingSenderId: '614338180587',
        projectId: 'mycc-6a699',
        authDomain: 'mycc-6a699.firebaseapp.com',
        storageBucket: 'mycc-6a699.firebasestorage.app',
        measurementId: 'G-9NVVXLV2SQ',
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
