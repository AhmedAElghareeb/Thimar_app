import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/features/get_faqs/bloc.dart';
import 'package:thimar_app/features/get_faqs/events.dart';
import 'package:thimar_app/features/get_faqs/states.dart';

import '../../../core/design/app_empty.dart';
import '../../../generated/locale_keys.g.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  final bloc = KiwiContainer().resolve<FaqsBloc>()..add(GetFaqsEvent());

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Repeated_Questions.tr(),
        ),
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
            if (state is GetFaqsLoadingState) {
              return Center(
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                  width: 100.w,
                  height: 100.h,
                ),
              );
            } else if (state is GetFaqsSuccessState) {
              return state.list.isEmpty
                  ? const AppEmpty(
                      assetsPath: "empty_cart.json",
                      text: "لا توجد بيانات",
                    )
                  : ListView.builder(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                        vertical: 44.h,
                      ),
                      itemCount: state.list.length,
                      itemBuilder: (context, index) => Container(
                        width: 342.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.r),
                          color: const Color(
                            0xffffffff,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.r,
                              offset: Offset(0.w, 5.h),
                              color: const Color(
                                0xfff5f5f5,
                              ),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: 10.w,
                              ),
                              child: Text(
                                state.list[index].question,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                width: 25.w,
                                height: 25.h,
                                margin: EdgeInsetsDirectional.only(
                                  end: 10.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: const Color(
                                    0xffB2BCA8,
                                  ).withOpacity(0.3),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 18.r,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => SimpleDialog(
                                    title: Center(
                                      child: Text(
                                        state.list[index].question,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        15.r,
                                      ),
                                    ),
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.all(
                                            5.r,
                                          ),
                                          child: Text(
                                            state.list[index].answer,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
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
