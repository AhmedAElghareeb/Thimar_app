import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountWidgets extends StatelessWidget {
  const AccountWidgets({
    super.key,
    this.onPress,
    this.imageName,
    this.title,
    this.isLogout = false,
  });

  final VoidCallback? onPress;
  final String? imageName, title;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 14.w,
        vertical: 15.h,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/icons/accountIcons/$imageName",
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            isLogout
                ? Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.w,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/icons/arrow_left.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.w,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/icons/accountIcons/exit.svg",
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
