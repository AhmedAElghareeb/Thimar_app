import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login.dart';
import 'package:thimar_app/views/main/account/about_us.dart';
import 'package:thimar_app/views/main/account/address/address.dart';
import 'package:thimar_app/views/main/account/contact_us.dart';
import 'package:thimar_app/views/main/account/edit_profile.dart';
import 'package:thimar_app/views/main/account/faqs.dart';
import 'package:thimar_app/views/main/account/suggestions_and_complaints.dart';
import 'package:thimar_app/views/main/account/policy.dart';
import 'package:thimar_app/views/main/account/terms_conditions.dart';
import 'package:thimar_app/views/main/account/wallet/view.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 217.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.r),
                  bottomLeft: Radius.circular(40.r),
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "حسابي",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                        0xffFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Container(
                    width: 76.w,
                    height: 71.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15.r,
                      ),
                    ),
                    child: Image.network(
                      CacheHelper.getImage(),
                      width: 76.w,
                      height: 71.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    CacheHelper.getFullName(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                        0xffFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    CacheHelper.getPhone(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(
                        0xffA2D273,
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
              width: 342.w,
              height: 152.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                color: const Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const EditProfile(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/person.svg",
                            width: 14.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "البيانات الشخصية",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 179.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const WalletView(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/wallet.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "المحفظة",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 220.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const Address(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/address.svg",
                            width: 16.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "العناوين",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 228.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
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
              width: 342.w,
              height: 244.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                color: const Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: ()
                      {
                        navigateTo(const Faqs(),);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/question.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "أسئلة متكررة",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 200.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const PolicyView(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/policy.svg",
                            width: 16.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "سياسة الخصوصية",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 169.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const ContactUs(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/contact_us.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "تواصل معنا",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 206.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const SugestionsAndComplaints(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/proposal.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "الشكاوي والأقتراحات",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 160.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/sharing.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "مشاركة التطبيق",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 183.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
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
              width: 342.w,
              height: 197.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                color: const Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const AboutUs(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/about_us.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "عن التطبيق",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 208.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/lang.svg",
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "تغيير اللغة",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 213.w,
                        ),
                        Container(
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
                            size: 12.w.h,
                            color: const Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          const TermsAndConditions(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/conditions.svg",
                            width: 18.w,
                            height: 18.h,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "الشروط والأحكام",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 180.w,
                          ),
                          Container(
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
                              size: 12.w.h,
                              color: const Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 15.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/app_rate.svg",
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          "تقييم التطبيق",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 197.w,
                        ),
                        Container(
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
                            size: 12.w.h,
                            color: const Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: ()
              {
                CacheHelper.removeLoginData();
                navigateTo(const LoginScreen(),);
              },
              child: Container(
                width: 342.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    17.r,
                  ),
                  color: const Color(
                    0xffFFFFFF,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 15.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "تسجيل الخروج",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 216.w,
                      ),
                      Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: const Color(0xffFFFFFF),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.w.h),
                          child: SvgPicture.asset(
                            "assets/images/icons/accountIcons/exit.svg",
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
