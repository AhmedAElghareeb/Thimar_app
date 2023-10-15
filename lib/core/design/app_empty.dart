import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppEmpty extends StatelessWidget {
  final String assetsPath, text;
  const AppEmpty({super.key, required this.assetsPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/$assetsPath',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
