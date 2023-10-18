import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/features/products_rates/bloc.dart';
import 'package:thimar_app/features/products_rates/events.dart';
import 'package:thimar_app/features/products_rates/states.dart';

import '../../../../core/design/app_loading.dart';

class RatesView extends StatefulWidget {
  final int id;

  const RatesView({super.key, required this.id});

  @override
  State<RatesView> createState() => _RatesViewState();
}

class _RatesViewState extends State<RatesView> {
  final rateBloc = KiwiContainer().resolve<ProductsRatesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جميع التقييمات",
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
      body: BlocBuilder(
        bloc: rateBloc
          ..add(
            GetProductsRatesEvent(
              id: widget.id,
            ),
          ),
        builder: (context, state) {
          if (state is ProductsRatesLoadingState) {
            return Center(
              child: Lottie.asset(
                "assets/lottie/loading.json",
                width: 100.w,
                height: 100.h,
              ),
            );
            ;
          } else if (state is ProductsRatesSuccessState) {
            return state.list.isEmpty
                ? const AppEmpty(
                    assetsPath: "empty.json",
                    text: "لا توجد بيانات",
                  )
                : ListView.separated(
                    padding: EdgeInsetsDirectional.symmetric(
                      vertical: 20.h,
                    ),
                    itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      height: 87.h,
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 13.w,
                          top: 6.h,
                        ),
                        margin: EdgeInsetsDirectional.only(
                          start: 13.w,
                          end: 13.w,
                        ),
                        width: 267.w,
                        height: 87.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.r),
                          color: const Color(
                            0xff707070,
                          ).withOpacity(0.008),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.list[index].clientName,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    RatingBar.builder(
                                      initialRating: state.list[index].value,
                                      minRating: state.list[index].value,
                                      maxRating: state.list[index].value,
                                      ignoreGestures: true,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 18,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  state.list[index].comment,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                            Image.network(
                              state.list[index].clientImage,
                              width: 55.w,
                              height: 55.h,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    itemCount: state.list.length,
                  );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    rateBloc.close();
  }
}
