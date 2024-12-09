import 'package:firebase_authentication/global/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(
      Duration(seconds: 10),(){
    //   //  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!), (route) => false);
    }
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.shade200,
                Colors.green.shade200
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
          ),
          child: Column(
            children: [
              SizedBox(height: 150,),
              Text("BIKERS WORLD",style: TextStyle(fontFamily: 'FontMain',color:Colors.white,fontSize: 25),),
              Center(
                  child: LottieBuilder.asset("assets/animation/aani.json",)),

            ],
          ),
        ) ,
      ),
    );
  }
}
