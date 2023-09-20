import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/account/about_us.dart';
import 'package:thimar_app/views/main/account/address/address.dart';
import 'package:thimar_app/views/main/account/contact_us.dart';
import 'package:thimar_app/views/main/account/edit_profile.dart';
import 'package:thimar_app/views/main/account/sugestions and complaints.dart';
import 'package:thimar_app/views/main/account/policy.dart';
import 'package:thimar_app/views/main/account/wallet/wallet.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 217,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "حسابي",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xffFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                    width: 76,
                    height: 71,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Image.network(
                        "https://thimar.amr.aait-d.com/public/dashboardAssets/images/backgrounds/avatar.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "محمد علي",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xffFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "96654787856+",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        0xffA2D273,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 151,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          EditProfile(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/person.svg",
                            width: 14,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "البيانات الشخصية",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 179,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          Wallet(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/wallet.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "المحفظة",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          Address(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/address.svg",
                            width: 16,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "العناوين",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 228,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 255,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/question.svg",
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "أسئلة متكررة",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          PolicyView(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/policy.svg",
                            width: 16,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "سياسة الخصوصية",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 169,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          ContactUs(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/contact_us.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "تواصل معنا",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 206,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          SugestionsAndComplaints(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/proposal.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "الشكاوي والأقتراحات",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/sharing.svg",
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "مشاركة التطبيق",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 183,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Color(
                  0xffFFFFFF,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(
                          AboutUs(),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/about_us.svg",
                            width: 18,
                            height: 18,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "عن التطبيق",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 208,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(
                                  0xffB2BCA8,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 12,
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/lang.svg",
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "تغيير اللغة",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 213,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/conditions.svg",
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "الشروط والأحكام",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
                              0xffB2BCA8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/accountIcons/app_rate.svg",
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "تقييم التطبيق",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 197,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(
                                0xffB2BCA8,
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12,
                            color: Color(
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Color(
                  0xffFFFFFF,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 218,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: SvgPicture.asset(
                          "assets/images/icons/accountIcons/exit.svg",
                          width: 18,
                          height: 18,
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
    );
  }
}
