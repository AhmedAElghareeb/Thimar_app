import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/features/orders/bloc.dart';
import 'package:thimar_app/features/orders/events.dart';
import 'package:thimar_app/features/orders/states.dart';

import '../../../core/logic/helper_methods.dart';

class OrderDetails extends StatefulWidget {
  final int id;

  const OrderDetails({super.key, required this.id});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final bloc = KiwiContainer().resolve<OrdersBloc>();

  final cancelBloc = KiwiContainer().resolve<OrdersBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc.add(
      GetOrderDetailsDataEvent(
        num: widget.id,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.close();
    cancelBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تفاصيل الطلب",
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
        bloc: bloc,
        builder: (context, state) {
          if (state is GetOrderDetailsDataLoadingState) {
            return Center(
              child: Lottie.asset("assets/lottie/loading.json",
                  width: 100.w, height: 100.h),
            );
          } else if (state is GetOrderDetailsDataSuccessState) {
            return SafeArea(
              child: ListView(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 21.h,
                ),
                children: [
                  Container(
                    height: 120.h,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 17.r,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0.w, 6.h),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "طلب رقم : #${state.data.id}",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    state.data.date,
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
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 11.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(7.r),
                                color: getOrderStatusColor(
                                  state.data.status,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  getOrderStatus(
                                    state.data.status,
                                  ),
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    color: getOrderStatusTextColor(
                                        state.data.status),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  state.data.products.length,
                                  (index) => Container(
                                    width: 25.w,
                                    height: 25.h,
                                    clipBehavior: Clip.antiAlias,
                                    margin: EdgeInsetsDirectional.only(
                                      end: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(7.r),
                                      border: Border.all(
                                        color: const Color(
                                          0xff61B80C,
                                        ).withOpacity(0.06),
                                      ),
                                    ),
                                    child: Image.network(
                                      state.data.products[index].url,
                                      width: 25.w,
                                      height: 25.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                if (state.data.products.length > 3)
                                  Container(
                                    width: 25.w,
                                    height: 25.h,
                                    clipBehavior: Clip.antiAlias,
                                    margin: EdgeInsetsDirectional.only(
                                      end: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(7.r),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.13),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+${state.data.products.length - 3}",
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              "${state.data.totalPrice} ر.س",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Column(
                    children: [
                      Text(
                        "عنوان التوصيل",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                        width: 343.w,
                        height: 150.h,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            15.r,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 17.r,
                              blurStyle: BlurStyle.outer,
                              offset: Offset(
                                0.w,
                                6.h,
                              ),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.data.address.type,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "العنوان : ${state.data.address.location}",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff000000,
                                      ).withOpacity(0.2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "رقم الجوال : ${state.data.address.phone}",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff000000,
                                      ).withOpacity(0.2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "الوصف : ${state.data.address.description}",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff000000,
                                      ).withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 72.w,
                              height: 62.h,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(
                                  15.r,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: ()
                                {
                                  openMap(
                                    title: state.data.address.location,
                                    lat: state.data.address.lat,
                                    long: state.data.address.lng,
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/images/map.svg",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ملخص الطلب",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                        width: 342.w,
                        height: 240.h,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 16.w,
                          vertical: 9.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            13.r,
                          ),
                          color: const Color(
                            0xffF3F8EE,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "إجمالي المنتجات",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "${state.data.priceBeforeDiscount} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "الخصم",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "${state.data.discount} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "الإجمالى بعد خصم المنتجات",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "${state.data.orderPrice} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "سعر التوصيل",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "${state.data.deliveryPrice} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "خصم عميل مميز",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                Text(
                                  "- ${state.data.vipDiscount} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "المجموع",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "${state.data.totalPrice} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تم الدفع بواسطة",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(
                                  state.data.payType,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      state.data.status == "pending"
                          ? BlocBuilder(
                              bloc: cancelBloc,
                              builder: (context, sC) {
                                if (sC is CancelOrdersDataLoadingState) {
                                  return const AppLoading();
                                } else {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 60.h,
                                    child: FilledButton(
                                      onPressed: () {
                                        cancelBloc.add(
                                          CancelOrderDataEvent(
                                            orderNum: state.data.id,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "إلغاء الطلب",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(
                                            0xffFF0000,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

Future<void> openMap({String? title, lat, long}) async {
  final availableMaps = await MapLauncher.installedMaps;
  await availableMaps.first.showMarker(
    coords: Coords(
      lat,
      long,
    ),
    title: title!,
  );
}
