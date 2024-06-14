import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/orders/events.dart';
import 'package:thimar_app/views/main/account/address/address.dart';
import 'package:thimar_app/views/main/order/widgets/address_item.dart';
import 'package:thimar_app/views/main/view.dart';
import '../../../features/address/bloc.dart';
import '../../../features/address/events.dart';
import '../../../features/address/states.dart';
import '../../../features/cart/states.dart';
import '../../../features/orders/bloc.dart';
import '../../../features/orders/states.dart';

class FinishOrder extends StatefulWidget {
  final GetCartDataSuccessState data;

  const FinishOrder({super.key, required this.data});

  @override
  State<FinishOrder> createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  final _formKey = GlobalKey<FormState>();

  final addressBloc = KiwiContainer().resolve<AddressBloc>();

  final completeBloc = KiwiContainer().resolve<OrdersBloc>();

  final _event = PostOrderDataEvent();

  @override
  void dispose() {
    super.dispose();
    addressBloc.close();
    completeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إتمام الطلب",
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
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 31.h,
          ),
          children: [
            Text(
              "الإسم : ${CacheHelper.getFullName()}",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              "الجوال : ${CacheHelper.getPhone()}",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "اختر عنوان التوصيل",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 26.w,
                      height: 26.h,
                      child: FloatingActionButton(
                        onPressed: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(
                                  38.r,
                                ),
                                topEnd: Radius.circular(
                                  38.r,
                                ),
                              ),
                            ),
                            context: context,
                            builder: (context) => BlocBuilder(
                              bloc: addressBloc
                                ..add(
                                  GetUserAddressEvent(),
                                ),
                              builder: (context, state) {
                                if (state is GetUserAddressLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is GetUserAddressSuccessState) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Center(
                                        child: Text(
                                          "العناوين",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AddressesListView(onSubmit: (x) {
                                          _event.addressModel = x;
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        }),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          );
                        },
                        mini: true,
                        backgroundColor: const Color(0xff4C8613).withOpacity(
                          0.13,
                        ),
                        elevation: 0.0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            9.r,
                          ),
                          borderSide: BorderSide(
                            color: const Color(
                              0xffFFFFFF,
                            ).withOpacity(0.14),
                          ),
                        ),
                        child: Icon(
                          _event.addressModel == null ? Icons.add : Icons.edit,
                          color: Theme.of(context).primaryColor,
                          size: 22.r,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                if (_event.addressModel != null)
                  OrderConfirmationAddressItem(_event.addressModel!),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تحديد وقت التوصيل",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final day = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(
                              days: 360,
                            ),
                          ),
                        );
                        if (day != null) {
                          _event.date = DateFormat('yyyy-MM-dd').format(day).toString();
                          if (kDebugMode) {
                            print("_____=====____$day");
                          }
                          setState(() {});
                        } else {
                          showSnackBar(
                            "يجب اختيار تاريخ",
                            typ: MessageType.warning,
                          );
                        }
                      },
                      child: Container(
                        width: 163.w,
                        height: 60.h,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 13.w,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.r,
                              color: const Color(
                                0xff000000,
                              ).withOpacity(
                                0.16,
                              ),
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0.w, 6.h),
                            ),
                          ],
                          borderRadius: BorderRadiusDirectional.circular(
                            15.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _event.date ?? "اختر اليوم والتاريخ",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/images/date.svg",
                              width: 17.w,
                              height: 17.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final time1 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time1 != null) {
                          if (kDebugMode) {
                            print('=--=-=-=-=-=  ${time1.toString()}');
                          }
                          _event.time = '${time1.hour.toString().padLeft(2, '0')}:${time1.minute.toString().padLeft(2, '0')}';
                              // time1
                              // .toString()
                              // .replaceAll(')', '')
                              // .replaceAll('TimeOfDay(', '');
                          setState(() {});
                        } else {
                          showSnackBar(
                            "يجب تحديد وقت",
                            typ: MessageType.warning,
                          );
                        }
                      },
                      child: Container(
                        width: 163.w,
                        height: 60.h,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 13.w,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.r,
                              color: const Color(
                                0xff000000,
                              ).withOpacity(
                                0.16,
                              ),
                              blurStyle: BlurStyle.outer,
                              offset: Offset(
                                0.w,
                                6.h,
                              ),
                            ),
                          ],
                          borderRadius: BorderRadiusDirectional.circular(
                            15.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _event.time ?? "اختر الوقت",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/images/time.svg",
                              width: 17.w,
                              height: 17.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ملاحظات وتعليمات",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  AppInput(
                    controller: _event.noteController,
                    minLines: 5,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اختر طريقة الدفع",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _event.payType = "cash";
                        setState(() {});
                      },
                      child: Container(
                        width: 104.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            11.r,
                          ),
                          border: Border.all(
                              color: _event.payType == "cash"
                                  ? Theme.of(context).primaryColor
                                  : const Color(
                                      0xffE9E9E9,
                                    )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/money.svg",
                              width: 29.w,
                              height: 23.h,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "كاش",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: _event.payType == "cash"
                                      ? Theme.of(context).primaryColor
                                      : const Color(
                                          0xffE9E9E9,
                                        )),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _event.payType = "visa";
                        setState(() {});
                      },
                      child: Container(
                        width: 104.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            11.r,
                          ),
                          border: Border.all(
                            color: _event.payType == "visa"
                                ? Theme.of(context).primaryColor
                                : const Color(
                                    0xffE9E9E9,
                                  ),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/visa.svg",
                            width: 63.w,
                            height: 19.h,
                            color: _event.payType == "visa"
                                ? Theme.of(context).primaryColor
                                : const Color(
                                    0xffE9E9E9,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _event.payType = "wallet";
                        setState(() {});
                      },
                      child: Container(
                        width: 104.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(
                            11.r,
                          ),
                          border: Border.all(
                            color: _event.payType == "wallet"
                                ? Theme.of(context).primaryColor
                                : const Color(
                                    0xffE9E9E9,
                                  ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icons/wallet.png",
                              width: 29.w,
                              height: 23.h,
                              fit: BoxFit.scaleDown,
                              color: _event.payType == "wallet"
                                  ? Theme.of(context).primaryColor
                                  : const Color(
                                      0xffE9E9E9,
                                    ),
                            ),
                            Text(
                              "المحفظة",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: _event.payType == "wallet"
                                      ? Theme.of(context).primaryColor
                                      : const Color(
                                          0xffE9E9E9,
                                        )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  height: 13.h,
                ),
                Container(
                  width: 343.w,
                  height: 139.h,
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
                            "${(widget.data.priceBefore)} ر.س",
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
                            "${(widget.data.discount)} ر.س",
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
                      widget.data.deliveryCost != 0
                          ? Row(
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
                                  "${(widget.data.deliveryCost)} ر.س",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
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
                            "${(widget.data.priceWithVat)} ر.س",
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
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder(
              bloc: completeBloc,
              builder: (context, state) {
                return AppButton(
                  onTap: () {
                    if (_event.date == null) {
                      showSnackBar(
                        "يجب تحديد اليوم",
                        typ: MessageType.warning,
                      );
                    } else if (_event.addressModel == null) {
                      showSnackBar(
                        "يجب تحديد العنوان",
                        typ: MessageType.warning,
                      );
                    } else if (_event.time == null) {
                      showSnackBar(
                        "يجب تحديد وقت",
                        typ: MessageType.warning,
                      );
                    } else if (state is PostOrdersDataFailedState) {
                      showSnackBar(state.msg);
                    } else {
                      completeBloc.add(_event);
                      navigateTo(
                        const HomeView(),
                      );
                    }
                  },
                  text: "إتمام الطلب",
                  isLoading: state is PostOrdersDataLoadingState,
                  radius: 15.r,
                  width: 343.w,
                  height: 60.h,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
