import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/features/about_us/cubit.dart';
import 'package:thimar_app/features/about_us/states.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    GetAboutUsCubit cubit = BlocProvider.of(context);
    cubit.getAboutData();
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
          bloc: cubit,
          builder: (context, state) {
            if (state is GetAboutUsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAboutUsSuccessState) {
              return ListView(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 26.h,
                ),
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
                    data: cubit.data,
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("FAILED"),
              );
            }
          },
        ),
      ),
    );
  }
}
