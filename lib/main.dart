import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/category/cubit.dart';
import 'package:thimar_app/features/category_products/cubit.dart';
import 'package:thimar_app/features/confirm_code/cubit.dart';
import 'package:thimar_app/features/get_cities/cubit.dart';
import 'package:thimar_app/features/get_faqs/cubit.dart';
import 'package:thimar_app/features/login/cubit.dart';
import 'package:thimar_app/features/policy/cubit.dart';
import 'package:thimar_app/features/products/cubit.dart';
import 'package:thimar_app/features/products_details/cubit.dart';
import 'package:thimar_app/features/register/cubit.dart';
import 'package:thimar_app/features/slider_images/cubit.dart';
import 'package:thimar_app/views/auth/splash.dart';
import 'features/about_us/cubit.dart';
import 'features/suggestions_and_complaints/cubit.dart';
import 'features/terms_conditions/cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.getToken().then(
    (value) {
      print("FCM Token is : $value");
    },
  );
  CacheHelper.init();
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => GetCitiesCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryProductsCubit(),
          ),
          BlocProvider(
            create: (context) => ProductsCubit(),
          ),
          BlocProvider(
            create: (context) => ShowProductsDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => GetSliderImagesCubit(),
          ),
          BlocProvider(
            create: (context) => GetFaqsCubit(),
          ),
          BlocProvider(
            create: (context) => GetPolicyCubit(),
          ),
          BlocProvider(
            create: (context) => GetAboutUsCubit(),
          ),
          BlocProvider(
            create: (context) => GetTermsCubit(),
          ),
          BlocProvider(
            create: (context) => GetSuggestionsCubit(),
          ),
          BlocProvider(
            create: (context) => VerifyCodeCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: const Color(
                0xffFFFFFF,
              ),
              centerTitle: true,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                fontSize: 20.sp,
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
                    15.r,
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
                    15.r,
                  ),
                ),
                side: const BorderSide(
                  color: Color(0xFFFFE1E1),
                ),
                backgroundColor: const Color(0xFFFFE1E1),
              ),
            ),
          ),
          builder: (context, child) => Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
