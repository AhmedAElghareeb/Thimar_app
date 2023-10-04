import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:share/share.dart';
import 'package:thimar_app/core/design/account_widgets.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/logout/bloc.dart';
import 'package:thimar_app/features/logout/states.dart';
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
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../features/logout/events.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final bloc = KiwiContainer().resolve<LogoutBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

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
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const EditProfile(),
                      );
                    },
                    title: "البيانات الشخصية",
                    imageName: "person.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const WalletView(),
                      );
                    },
                    title: "المحفظة",
                    imageName: "wallet.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const Address(),
                      );
                    },
                    title: "العناوين",
                    imageName: "address.svg",
                    isLogout: true,
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
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const Faqs(),
                      );
                    },
                    title: "أسئلة متكررة",
                    imageName: "question.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const PolicyView(),
                      );
                    },
                    title: "سياسة الخصوصية",
                    imageName: "policy.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const ContactUs(),
                      );
                    },
                    title: "تواصل معنا",
                    imageName: "contact_us.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const SugestionsAndComplaints(),
                      );
                    },
                    title: "الشكاوي والأقتراحات",
                    imageName: "proposal.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      Share.share(
                        "https://play.google.com/store/apps/details?id=com.alalmiya.thamra&hl=ar&gl=US&pli=1",
                      );
                    },
                    title: "مشاركة التطبيق",
                    imageName: "sharing.svg",
                    isLogout: true,
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
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const AboutUs(),
                      );
                    },
                    title: "عن التطبيق",
                    imageName: "about_us.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      String code =
                          context.locale.languageCode == "en" ? "ar" : "en";
                      context.setLocale(
                        Locale(
                          code,
                        ),
                      );
                      showSnackBar(
                        "تم تغيير اللغة",
                        typ: MessageType.success,
                      );
                    },
                    title: "تغيير اللغة",
                    imageName: "lang.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const TermsAndConditions(),
                      );
                    },
                    title: "الشروط والأحكام",
                    imageName: "conditions.svg",
                    isLogout: true,
                  ),
                  AccountWidgets(
                    onPress: () {
                      launchUrlString(
                        "https://play.google.com/store/apps/details?id=com.alalmiya.thamra&hl=ar&gl=US&pli=1",
                      );
                    },
                    title: "تقييم التطبيق",
                    imageName: "app_rate.svg",
                    isLogout: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is LogoutLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LogoutFailedState) {
                  return const Text(
                    "Failed",
                  );
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: InkWell(
                      onTap: () {
                        bloc.add(
                          SendLogout(),
                        );
                        navigateTo(
                          const LoginScreen(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "تسجيل الخروج",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/icons/accountIcons/exit.svg",
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
