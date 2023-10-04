import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotButton extends StatelessWidget {
  const DotButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: Theme.of(context).primaryColor,
      radius: Radius.circular(
        15.r,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 2.h,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54.h,
          width: 343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: const Color(
              0xfffafafa,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
