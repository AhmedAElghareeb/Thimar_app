import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/account/wallet/all_transactions.dart';
import 'package:thimar_app/views/main/account/wallet/recharge_now.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحفظة"),
        leading: Padding(
          padding: EdgeInsetsDirectional.all(
            10.r,
          ),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: const Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
          children: [
            Container(
              width: 343.w,
              height: 168.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(
                  0xffffffff,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.r,
                    color: const Color(
                      0xfff6f6f6,
                    ),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "رصيدك",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "225 ر.س",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            DotButton(
              text: "اشحن الآن",
              onTap: () {
                navigateTo(
                  const RechargeNow(),
                );
              },
            ),
            SizedBox(
              height: 59.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "سجل المعاملات",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(
                      const AllTransactions(),
                    );
                  },
                  child: Text(
                    "عرض الكل",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Container(
              width: 343.w,
              height: 83.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(
                  0xffffffff,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.r,
                    color: const Color(
                      0xfff6f6f6,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(8.w.h),
                        child: SvgPicture.asset(
                          "assets/images/icons/walletIcons/incoming.svg",
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        "شحن المحفظة",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 113.w,
                      ),
                      Text(
                        "27,فبراير,2021",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                          color: const Color(
                            0xff9C9C9C,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 40.w,
                      end: 200.w,
                    ),
                    child: Text(
                      "255 ر.س",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 343.w,
              height: 83.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(
                  0xffffffff,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.r,
                    color: const Color(
                      0xfff6f6f6,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(
                          8.r,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/icons/walletIcons/incoming.svg",
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        "شحن المحفظة",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 113.w,
                      ),
                      Text(
                        "27,فبراير,2021",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                          color: const Color(
                            0xff9C9C9C,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 40.w,
                      end: 200.w,
                    ),
                    child: Text(
                      "255 ر.س",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 343.w,
              height: 145.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(
                  0xffffffff,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.r,
                    color: const Color(
                      0xfff6f6f6,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(
                          8.r,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/icons/walletIcons/paidTo.svg",
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        "دفعت مقابل هذا الطلب",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 63.w,
                      ),
                      Text(
                        "27,فبراير,2021",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                          color: const Color(
                            0xff9C9C9C,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 320.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                      color: const Color(
                        0xffffffff,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.r,
                          color: const Color(
                            0xfff6f6f6,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 7.h,
                            start: 13.w,
                          ),
                          child: Text(
                            "طلب #4587",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.all(
                                10.r,
                              ),
                              child: Image.network(
                                "https://avatars.mds.yandex.net/get-tycoon/5573087/2a000001813e654364145f8d466e8d00ffb8/priority-product-x-large",
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.all(
                                10.r,
                              ),
                              child: Image.network(
                                "https://avatars.mds.yandex.net/get-tycoon/5573087/2a000001813e654364145f8d466e8d00ffb8/priority-product-x-large",
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.all(
                                10.r,
                              ),
                              child: Image.network(
                                "https://avatars.mds.yandex.net/get-tycoon/5573087/2a000001813e654364145f8d466e8d00ffb8/priority-product-x-large",
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: const Color(
                                  0xffEDF5E6,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "2+",
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 105.w,
                            ),
                            Text(
                              "180 ر.س",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
