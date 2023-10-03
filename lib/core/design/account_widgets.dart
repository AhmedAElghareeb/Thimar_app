import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountWidgets extends StatelessWidget {
  const AccountWidgets({
    super.key,
    this.onPress,
    this.imageName,
    this.title,
    this.isLoading = false,
    this.isLogout = false,
  });

  final VoidCallback? onPress;
  final String? imageName, title;
  final bool isLoading, isLogout;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
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
                      ? Container(
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12.r,
                            color: const Color(
                              0xffB2BCA8,
                            ),
                          ),
                        )
                      : Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 16.w),
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
