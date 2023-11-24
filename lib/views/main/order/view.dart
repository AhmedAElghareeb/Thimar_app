import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/orders/bloc.dart';
import 'package:thimar_app/features/orders/events.dart';
import 'package:thimar_app/features/orders/states.dart';
import 'package:thimar_app/views/main/order/order_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final bloc = KiwiContainer().resolve<OrdersBloc>();
  String type = 'current';

  @override
  void initState() {
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
      body: CacheHelper.getToken().isEmpty
          ? const AppEmpty(
            assetsPath: "empty.json",
            text: "الرجاء تسجيل الدخول اولا",
          )
          : Column(
              children: [
                Container(
                  height: 55.h,
                  width: 343.w,
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
                          width: 165.w,
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
                Expanded(
                  child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is GetOrdersDataLoadingState) {
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          // shrinkWrap: true,
                          itemCount: 5,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 16.w,
                          ),
                          // physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.4),
                              highlightColor: Colors.grey.withOpacity(0.8),
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.h,
                                  horizontal: 14.w,
                                ),
                                margin: EdgeInsetsDirectional.symmetric(
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                    15.r,
                                  ),
                                  color: Colors.black.withOpacity(
                                    0.005,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.02),
                                      blurRadius: 2.r,
                                      blurStyle: BlurStyle.inner,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "رقم الطلب",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text(
                                              "التاريخ",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(
                                                  0xff9C9C9C,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "السعر / ر.س",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is GetOrdersDataSuccessState) {
                        return state.data.isEmpty
                            ? const AppEmpty(
                                assetsPath: "empty_orders.json",
                                text: "لا توجد بيانات",
                              )
                            : ListView.separated(
                                scrollDirection: Axis.vertical,
                                // shrinkWrap: true,
                                itemCount: state.data.length,
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 16.w,
                                ),
                                // physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemBuilder: (context, index) {
                                  final item = state.data[index];
                                  return GestureDetector(
                                    onTap: () {
                                      navigateTo(
                                        OrderDetails(
                                          id: item.id,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsetsDirectional.symmetric(
                                        vertical: 10.h,
                                        horizontal: 14.w,
                                      ),
                                      margin: EdgeInsetsDirectional.symmetric(
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                          15.r,
                                        ),
                                        color: Colors.black.withOpacity(
                                          0.005,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.02),
                                            blurRadius: 2.r,
                                            blurStyle: BlurStyle.inner,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "طلب رقم : ${item.id}#",
                                                    style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    item.date,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: const Color(
                                                        0xff9C9C9C,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 95.w,
                                                height: 23.h,
                                                padding: EdgeInsetsDirectional
                                                    .symmetric(
                                                  horizontal: 11.w,
                                                  vertical: 5.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(7.r),
                                                  color: getOrderStatusColor(
                                                    item.status,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    getOrderStatus(
                                                      item.status,
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          getOrderStatusTextColor(
                                                              item.status,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            thickness: 1.5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ...List.generate(
                                                    item.products.length,
                                                    (index) => Container(
                                                      width: 25.w,
                                                      height: 25.h,
                                                      clipBehavior:
                                                          Clip.antiAlias,
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
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .only(end: 3.w),
                                                      child: Image.network(
                                                        item.products[index]
                                                            .url,
                                                        width: 25.w,
                                                        height: 25.h,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  if (item.products.length > 3)
                                                    Container(
                                                      width: 25.w,
                                                      height: 25.h,
                                                      clipBehavior:
                                                          Clip.antiAlias,
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
                                                          "+${item.products.length - 3}",
                                                          style: TextStyle(
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Text(
                                                "${item.totalPrice} ر.س",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
      // bottomNavigationBar: HomeNavBar(),
    );
  }
}
