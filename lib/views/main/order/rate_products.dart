import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/features/products_rates/events.dart';
import 'package:thimar_app/features/products_rates/states.dart';

import '../../../features/products_rates/bloc.dart';

class RateProducts extends StatefulWidget {
  const RateProducts({super.key});

  @override
  State<RateProducts> createState() => _RateProductsState();
}

class _RateProductsState extends State<RateProducts> {
  final addRateBloc = KiwiContainer().resolve<ProductsRatesBloc>();
  final _event = AddRateToProductEvent(
    id: 0,
    value: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تقييم المنتجات",
        ),
        leading: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(9.r),
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
        bloc: addRateBloc,
        builder: (context, state) {
          return ListView(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 16.w,
              vertical: 41.h,
            ),
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.r),
                    color: const Color(
                      0xffffffff,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.r,
                        blurStyle: BlurStyle.inner,
                        color: const Color(
                          0xffF1F1F1,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 8.h,
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              "https://www.seeds-gallery.com/2330-large_default/moneymaker-tomato-seeds.jpg",
                              width: 75.w,
                              height: 64.h,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "طماطم",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "السعر / 1كجم",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(
                                      0xff808080,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "45 ر.س",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      "56 ر.س",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Center(
                        child: RatingBar.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {},
                          itemSize: 30,
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          initialRating: 2,
                          minRating: 1,
                          maxRating: 5,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 11.w,
                        ),
                        child: AppInput(
                          controller: _event.productComment,
                          labelText: "تعليق المنتج",
                          minLines: 3,
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              AppButton(
                isLoading: state is AddRateToProductLoadingState,
                onTap: () {
                  // addRateBloc.add(
                  //   AddRateToProductEvent(
                  //     id: 0,
                  //     value: 0,
                  //   ),
                  // );
                },
                text: "تقييم",
                width: 343.w,
                height: 60.h,
                radius: 15.r,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addRateBloc.close();
  }
}
