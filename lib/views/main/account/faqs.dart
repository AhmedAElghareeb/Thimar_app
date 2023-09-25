import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/features/get_faqs/cubit.dart';
import 'package:thimar_app/features/get_faqs/states.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    GetFaqsCubit cubit = BlocProvider.of(context);
    cubit.getFaqsData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("أسئلة متكررة"),
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
            if (state is GetFaqsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetFaqsSuccessState) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 44.h),
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
                        padding: EdgeInsets.only(
                          right: 10.w,
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
                          width: 20.w,
                          height: 20.h,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: const Color(
                              0xffB2BCA8,
                            ).withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 16.w.h,
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
                                    padding: EdgeInsets.all(5.w.h),
                                    child: Text(
                                      state.list[index].answer,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold
                                      ),
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
