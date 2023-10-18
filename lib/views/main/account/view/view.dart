import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:share/share.dart';
import 'package:thimar_app/core/design/account_widgets.dart';
import 'package:thimar_app/core/design/app_loading.dart';
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
import '../../../../generated/locale_keys.g.dart';

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
                    CacheHelper.getToken().isEmpty ? "اسم المستخدم" : CacheHelper.getFullName(),
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
                    CacheHelper.getToken().isEmpty ? "" : CacheHelper.getPhone(),
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
            if(CacheHelper.getToken().isNotEmpty)
              Container(
              width: 342.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xff000000,
                    ).withOpacity(0.16),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 3.r,
                  ),
                ],
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
                    title: LocaleKeys.Personal_Data.tr(),
                    imageName: "person.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const WalletView(),
                      );
                    },
                    title: LocaleKeys.Wallet.tr(),
                    imageName: "wallet.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const Address(),
                      );
                    },
                    title: LocaleKeys.Addresses.tr(),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xff000000,
                    ).withOpacity(0.16),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 3.r,
                  ),
                ],
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
                    title: LocaleKeys.Repeated_Questions.tr(),
                    imageName: "question.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const PolicyView(),
                      );
                    },
                    title: LocaleKeys.Privacy_Policy.tr(),
                    imageName: "policy.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const ContactUs(),
                      );
                    },
                    title: LocaleKeys.Contact_Us.tr(),
                    imageName: "contact_us.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const SugestionsAndComplaints(),
                      );
                    },
                    title: LocaleKeys.Suggestions_And_Complaints.tr(),
                    imageName: "proposal.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      Share.share(
                        "https://play.google.com/store/apps/details?id=com.alalmiya.thamra&hl=ar&gl=US&pli=1",
                      );
                    },
                    title: LocaleKeys.Share_App.tr(),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xff000000,
                    ).withOpacity(0.16),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 3.r,
                  ),
                ],
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
                    title: LocaleKeys.About_App.tr(),
                    imageName: "about_us.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      String code =
                          context.locale.languageCode == "en" ? "ar" : "en";
                      context.setLocale(
                        Locale(
                          code,
                        ),
                      );
                    },
                    title: LocaleKeys.Language_Changed.tr(),
                    imageName: "lang.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      navigateTo(
                        const TermsAndConditions(),
                      );
                    },
                    title: LocaleKeys.Terms_and_Conditions.tr(),
                    imageName: "conditions.svg",
                    isLogout: true,
                  ),
                  const Divider(),
                  AccountWidgets(
                    onPress: () {
                      launchUrlString(
                        "https://play.google.com/store/apps/details?id=com.alalmiya.thamra&hl=ar&gl=US&pli=1",
                      );
                    },
                    title: LocaleKeys.Rate_App.tr(),
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
                    child: AppLoading(),
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
                      child: CacheHelper.getToken().isEmpty ? Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          LocaleKeys.Login.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ) : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.LogOut.tr(),
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
