import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:lottie/lottie.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_empty.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/cart/events.dart';
import 'package:thimar_app/features/cart/states.dart';
import 'package:thimar_app/views/main/order/finish_order.dart';
import '../../../../features/cart/bloc.dart';
import '../../../../models/cart.dart';

class Cart extends StatefulWidget {
  // final num price;
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int counter = 1;

  final _formKey = GlobalKey<FormState>();

  final bloc = KiwiContainer().resolve<CartBloc>();

  final updateBloc = KiwiContainer().resolve<CartBloc>();

  final couponBloc = KiwiContainer().resolve<CartBloc>();

  void _init() {
    bloc.add(
      GetCartDataEvent(),
    );
  }

  void _update(int id, int amount) {
    setState(() {});
    updateBloc.add(
      UpdateCartDataEvent(
        id: id,
        amount: amount,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    updateBloc.close();
    couponBloc.close();
  }

  void _delete(GetCartDataSuccessState state, CartModel item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(
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
                bloc.deleteItem(item, (isSuccess) {
                  if (isSuccess) {
                    _init();
                    setMainCartCount();

                  }
                });
                state.list.removeWhere(
                  (element) => element.id == item.id,
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
              return Center(
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                  width: 100.w,
                  height: 100.h,
                ),
              );
            } else if (state is GetCartDataSuccessState) {
              return state.list.isEmpty
                  ? const AppEmpty(
                      assetsPath: "empty_cart.json",
                      text: "لا توجد بيانات",
                    )
                  : ListView(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.list[index].title,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          BlocListener<CartBloc, CartStates>(
                                            bloc: updateBloc,
                                            listener: (context, s) {
                                              if (s
                                                  is UpdateCartDataStateSuccess) {
                                                _init();
                                              }
                                            },
                                            child: Container(
                                              width: 72.w,
                                              height: 27.h,
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                horizontal: 2.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(7.r),
                                                color: const Color(
                                                  0xff707070,
                                                ).withOpacity(
                                                  0.2,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 23.w,
                                                    height: 23.h,
                                                    child: FloatingActionButton(
                                                      onPressed: () {
                                                        if (state.list[index]
                                                                .amount <
                                                            state.list[index]
                                                                .remainingAmount) {
                                                          state.list[index]
                                                              .amount++;
                                                          _update(
                                                              state.list[index]
                                                                  .id,
                                                              state.list[index]
                                                                  .amount);
                                                        } else {
                                                          showSnackBar(
                                                            "الكمية غير متاحة",
                                                            typ: MessageType
                                                                .warning,
                                                          );
                                                        }
                                                      },
                                                      mini: true,
                                                      heroTag: null,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffFFFFFF),
                                                      elevation: 0.0,
                                                      shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                    state.list[index].amount
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 23.w,
                                                    height: 23.h,
                                                    child: FloatingActionButton(
                                                      onPressed: () {
                                                        if (state.list[index]
                                                                .amount >
                                                            1) {
                                                          state.list[index]
                                                              .amount--;
                                                          _update(
                                                              state.list[index]
                                                                  .id,
                                                              state.list[index]
                                                                  .amount);
                                                        } else {
                                                          _delete(
                                                              state,
                                                              state
                                                                  .list[index]);
                                                        }
                                                      },
                                                      mini: true,
                                                      heroTag: null,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffFFFFFF),
                                                      elevation: 0.0,
                                                      shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _delete(state, state.list[index]);
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
                        BlocBuilder(
                          bloc: couponBloc,
                          builder: (context, state) {
                            return Form(
                              key: _formKey,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 255.w,
                                          child: AppInput(
                                            controller:
                                                couponBloc.couponController,
                                            labelText:
                                                "عندك كوبون ؟ ادخل رقم الكوبون",
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "الرجاء ادخال كوبون";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        couponBloc.add(
                                          AddCouponEvent(),
                                        );
                                      }
                                    },
                                    text: "تطبيق",
                                    isLoading: state is AddCouponLoadingState,
                                    width: 79.w,
                                    height: 39.h,
                                    radius: 10.r,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            state.taxMsg,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "${(state.priceBefore)} ر.س",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "${(state.discount)} ر.س",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    "${(state.priceWithVat)} ر.س",
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
                            navigateTo(
                              FinishOrder(
                                data: state,
                              ),
                            );
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
