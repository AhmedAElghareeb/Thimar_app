import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/policy/cubit.dart';
import 'package:thimar_app/features/policy/states.dart';

class PolicyView extends StatefulWidget {
  const PolicyView({super.key});

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  @override
  Widget build(BuildContext context) {
    GetPolicyCubit cubit = BlocProvider.of(context);
    cubit.getPolicyData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سياسة الخصوصية",
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
            if (state is GetPolicyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPolicySuccessState) {
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
