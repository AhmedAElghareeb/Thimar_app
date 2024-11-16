import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.icon,
  });

  final String? title;
  final String? subtitle;
  final Widget child;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 130,
                decoration: BoxDecoration(
                  color: const Color(0xffDCDCE4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Colors.grey.shade800,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (icon != null) SizedBox(width: 12.w),
              if (icon != null)
                SvgPicture.asset(
                  icon!,
                  width: 24,
                  height: 24,
                ),
            ],
          ),
          SizedBox(height: 5.h),
          if (subtitle != null)
            Text(
              subtitle!,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: Colors.grey.shade600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          SizedBox(height: 10.h),
          child,
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
