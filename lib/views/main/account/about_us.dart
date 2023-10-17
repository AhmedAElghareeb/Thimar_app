import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/features/about_us/states.dart';

import '../../../features/about_us/bloc.dart';
import '../../../features/about_us/events.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final bloc = KiwiContainer().resolve<AboutUsBloc>()..add(GetAboutUsEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عن التطبيق"),
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
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetAboutUsLoadingState) {
              return Center(
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                  width: 100.w,
                  height: 100.h,
                ),
              );
            } else if (state is GetAboutUsSuccessState) {
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 26.h,
                ),
                child: bloc.data == null
                    ? const AppEmpty(
                        assetsPath: "empty_cart.json",
                        text: "لا توجد بيانات",
                      )
                    : Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/logo/logo1.svg",
                            width: 160.w,
                            height: 157.h,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Html(
                            data: bloc.data,
                          ),
                        ],
                      ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
