import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/login_cubit/cubit.dart';
import 'package:thimar_app/features/register_cubit/cubit.dart';
import 'package:thimar_app/views/auth/login.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(
              0xffFFFFFF,
            ),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: getMaterialColor(),
            ),
          ),
          primarySwatch: getMaterialColor(),
          platform: TargetPlatform.iOS,
          fontFamily: "Tajawal",
          scaffoldBackgroundColor: Colors.white,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              side: const BorderSide(
                color: Color(0xFF4C8613),
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              side: const BorderSide(
                color: Color(0xFFFFE1E1),
              ),
              backgroundColor: Color(0xFFFFE1E1),
            ),
          ),
        ),
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
