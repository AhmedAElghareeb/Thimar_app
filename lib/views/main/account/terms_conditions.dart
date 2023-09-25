import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/terms_conditions/cubit.dart';
import 'package:thimar_app/features/terms_conditions/states.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    GetTermsCubit cubit = BlocProvider.of(context);
    cubit.getTermsData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الشروط والأحكام",
        ),
        leading: Padding(
          padding: EdgeInsets.all(10.w.h),
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
                padding: EdgeInsets.only(
                  right: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.w.h,
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
            if (state is GetTermsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetTermsSuccessState) {
              return Html(
                data: cubit.data,
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
