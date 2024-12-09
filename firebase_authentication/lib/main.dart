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
        apiKey: 'AIzaSyCjXAPm91m0zh2qM18VSqHGuwMsdztmolg',
        appId: '1:162159884326:web:8f7b5e4a07cbe22eb1cee7',
        messagingSenderId: '162159884326',
        projectId: 'practice-a071a',
        authDomain: 'practice-a071a.firebaseapp.com',
        storageBucket: 'practice-a071a.appspot.com',
        measurementId: 'G-D3BJRNJVG3',
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
