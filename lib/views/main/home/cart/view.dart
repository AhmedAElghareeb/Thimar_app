import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/cart/events.dart';
import 'package:thimar_app/features/cart/states.dart';
import 'package:thimar_app/views/main/order/finish_order.dart';
import '../../../../features/cart/bloc.dart';

class Cart extends StatefulWidget {
  // final num price;
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int counter = 1;

  final couponController = TextEditingController();

  final bloc = KiwiContainer().resolve<CartBloc>()
    ..add(
      GetCartDataEvent(),
    );
  final updateBloc = KiwiContainer().resolve<CartBloc>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.close();
    updateBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "السلة",
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
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetCartDataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCartDataSuccessState) {
              return ListView(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                children: [
                  ...List.generate(
                    state.list.length,
                    (index) => Container(
                      width: 342.w,
                      height: 94.h,
                      padding: EdgeInsetsDirectional.only(
                        start: 6.w,
                        end: 16.w,
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
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.network(
                                  state.list[index].image,
                                  fit: BoxFit.cover,
                                  width: 92.w,
                                  height: 78.h,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.list[index].title,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Text(
                                      "${state.list[index].price} ر.س",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      width: 72.w,
                                      height: 27.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                7.r),
                                        color: const Color(
                                          0xff707070,
                                        ).withOpacity(
                                          0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 23.w,
                                            height: 23.h,
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                if (counter <
                                                    state.list[index].amount) {
                                                  counter++;
                                                  updateBloc.add(
                                                    UpdateCartDataEvent(
                                                      id: state.list[index].id,
                                                      amount: counter,
                                                    ),
                                                  );
                                                }
                                              },
                                              mini: true,
                                              heroTag: null,
                                              backgroundColor:
                                                  const Color(0xffFFFFFF),
                                              elevation: 0.0,
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7.r,
                                                ),
                                                borderSide: BorderSide(
                                                  color: const Color(
                                                    0xff707070,
                                                  ).withOpacity(0.1),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 16.r,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            counter.toString(),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 23.w,
                                            height: 23.h,
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                if (counter > 1) {
                                                  counter--;
                                                  updateBloc.add(
                                                    UpdateCartDataEvent(
                                                      id: state.list[index].id,
                                                      amount: counter,
                                                    ),
                                                  );
                                                }
                                              },
                                              mini: true,
                                              heroTag: null,
                                              backgroundColor:
                                                  const Color(0xffFFFFFF),
                                              elevation: 0.0,
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7.r,
                                                ),
                                                borderSide: BorderSide(
                                                  color: const Color(
                                                    0xff707070,
                                                  ).withOpacity(0.1),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 16.r,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(
                                      20.r,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  title: Center(
                                    child: Text(
                                      "هل تريد الحذف؟",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  content: Row(
                                    children: [
                                      AppButton(
                                        onTap: () {
                                          bloc.deleteItem(
                                            state.list[index],
                                          );
                                          state.list.removeWhere(
                                            (element) =>
                                                element.id ==
                                                state.list[index].id,
                                          );
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        text: "نعم",
                                        backColor: Colors.red,
                                        height: 50.h,
                                        radius: 7.r,
                                        width: 100.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      AppButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text: "لأ",
                                        height: 50.h,
                                        radius: 7.r,
                                        width: 100.w,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              "assets/images/delete.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 255.w,
                              child: AppInput(
                                controller: couponController,
                                labelText: "عندك كوبون ؟ ادخل رقم الكوبون",
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        onTap: () {},
                        text: "تطبيق",
                        width: 79.w,
                        height: 39.h,
                        radius: 10.r,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 111.h,
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
                              "180 ر.س",
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
                              "-40 ر.س",
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
                              "المجموع",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "140 ر.س",
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
                    height: 11.h,
                  ),
                  AppButton(
                    onTap: () {
                      // navigateTo(
                      //   FinishOrder(),
                      // );
                    },
                    text: "الانتقال لإتمام الطلب",
                    height: 60.h,
                    width: 343.w,
                    radius: 15.r,
                  ),
                ],
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
