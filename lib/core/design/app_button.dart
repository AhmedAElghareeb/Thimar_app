import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_loading.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backColor,
    this.textColor,
    this.width,
    this.height,
    this.radius,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String text;
  final Color? backColor;
  final Color? textColor;
  final double? width, height, radius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const FittedBox(
            fit: BoxFit.scaleDown,
            child: AppLoading(),
          )
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                radius!,
              ),
              color: backColor ?? Theme.of(context).primaryColor,
            ),
            child: MaterialButton(
              onPressed: onTap,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? const Color(0xFFFFFFFF),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
