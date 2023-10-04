import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';

class FinishOrder extends StatelessWidget {
  FinishOrder({super.key});

  final notesController = TextEditingController();

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
              "الإسم : محمد",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              "الجوال : 05068285914",
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
                        onPressed: () {},
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
                          Icons.add,
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
                Container(
                  width: 339.w,
                  height: 33.h,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 13.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      17.r,
                    ),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المنزل : 119 طريق الملك عبدالعزيز",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20.r,
                      ),
                    ],
                  ),
                ),
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
                          firstDate: DateTime(
                            1900,
                          ),
                          lastDate: DateTime(
                            2050,
                          ),
                        );
                        if (day != null) {
                          print(day);
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
                              "اختر اليوم والتاريخ",
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
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          print(time);
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
                              "اختر الوقت",
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
            Column(
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
                  controller: notesController,
                  minLines: 5,
                ),
              ],
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
                    Container(
                      width: 104.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
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
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 104.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                          color: const Color(
                            0xffE9E9E9,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/visa.svg",
                            width: 63.w,
                            height: 19.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 104.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(
                          11.r,
                        ),
                        border: Border.all(
                          color: const Color(
                            0xffE9E9E9,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/master.svg",
                            width: 43.w,
                            height: 33.h,
                          ),
                        ],
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
                  width: 342.w,
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
                            "سعر التوصيل",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "40 ر.س",
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
                            "180 ر.س",
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
            AppButton(
              onTap: () {},
              text: "إنهاء الطلب",
              radius: 15.r,
              width: 343.w,
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
