import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/features/orders/bloc.dart';
import 'package:thimar_app/features/orders/events.dart';
import 'package:thimar_app/features/orders/states.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final bloc = KiwiContainer().resolve<OrdersBloc>();
  String type = 'current';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() {
    bloc.add(GetOrdersDataEvent(type: type));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("طلباتي"),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        children: [
          Container(
            height: 55.h,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 5.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r),
              border: Border.all(
                color: const Color(
                  0xff000000,
                ).withOpacity(
                  0.16,
                ),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    type = 'current';
                    setState(() {});
                    _init();
                  },
                  child: Container(
                    height: 42.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: type == 'current'
                            ? Theme.of(context).primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: Text(
                        "الحالية",
                        style: TextStyle(
                          color: type == 'current'
                              ? Colors.white
                              : const Color(
                                  0xffA2A1A4,
                                ),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    type = 'finished';
                    setState(() {});
                    _init();
                  },
                  child: Container(
                    height: 42.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                        color: type == 'finished'
                            ? Theme.of(context).primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: Text(
                        "المنتهية",
                        style: TextStyle(
                          color: type == 'finished'
                              ? Colors.white
                              : const Color(
                                  0xffA2A1A4,
                                ),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetOrdersDataLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetOrdersDataSuccessState) {
                return state.data.isEmpty
                    ? Center(
                        child: Lottie.asset('assets/lottie/empty_cart.json'))
                    : ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemBuilder: (context, index) {
                          final _item = state.data[index];
                          return Container(
                            padding: EdgeInsetsDirectional.symmetric(
                              vertical: 10.h,
                              horizontal: 14.w,
                            ),
                            margin: EdgeInsetsDirectional.symmetric(
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 2.r,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0.w, 6.h),
                                )
                              ],
                            ),
                            height: 100.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "طلب رقم : ${_item.id}",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Text(
                                        _item.date,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(
                                            0xff9C9C9C,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13.h,
                                      ),
                                      Row(
                                        children: [
                                          ...List.generate(
                                            _item.products.length,
                                            (index) => Container(
                                              width: 25.w,
                                              height: 25.h,
                                              clipBehavior: Clip.antiAlias,
                                              margin:
                                                  EdgeInsetsDirectional.only(
                                                end: 3.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(7.r),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xff61B80C,
                                                  ).withOpacity(0.06),
                                                ),
                                              ),
                                              child: Image.network(
                                                _item.products[index].url,
                                                width: 25.w,
                                                height: 25.h,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                      if(_item.products.length>3)    Container(
                                            width: 25.w,
                                            height: 25.h,
                                            clipBehavior: Clip.antiAlias,
                                            margin: EdgeInsetsDirectional.only(
                                              end: 3.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(7.r),
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.13),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "+${_item.products.length-3}",
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 11.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                7.r),
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.13),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _item.status,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${_item.totalPrice} ر.س",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: state.data.length,
                      );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      // bottomNavigationBar: HomeNavBar(),
    );
  }
}
