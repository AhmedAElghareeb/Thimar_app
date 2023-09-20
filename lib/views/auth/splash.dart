import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';
import 'package:thimar_app/views/main/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          seconds: 3,
        ), () async {
      if (CacheHelper.getToken()!=null) {
        navigateTo(
          HomeView(),
        );
      } else {
        navigateTo(
          const LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -150,
            child: Image.asset(
              "assets/images/logo/bottom.png",
              height: 300,
              width: 450,
            ),
          ),
          SvgPicture.asset(
            "assets/images/logo/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Flash(
              animate: true,
              child: SvgPicture.asset(
                "assets/images/logo/logo1.svg",
                width: 160,
                height: 160,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
