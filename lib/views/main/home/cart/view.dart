import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/cart/finish_order.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final couponController = TextEditingController();

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
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const _Item(),
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
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
                navigateTo(
                  FinishOrder(),
                );
              },
              text: "الانتقال لإتمام الطلب",
              height: 60.h,
              width: 343.w,
              radius: 15.r,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      25.r,
                    ),
                  ),
                  child: Image.network(
                    "https://avatars.mds.yandex.net/i?id=02ddd2a087c23724f02d8b1fc6e388aa0e74c0d0-10933813-images-thumbs&n=13",
                    width: 92.w,
                    height: 78.h,
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "طماطم",
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
                      "45 ر.س",
                      style: TextStyle(
                        fontSize: 13.sp,
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
                        borderRadius: BorderRadiusDirectional.circular(7.r),
                        color: const Color(
                          0xff707070,
                        ).withOpacity(
                          0.2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 23.w,
                            height: 23.h,
                            child: FloatingActionButton(
                              onPressed: () {},
                              mini: true,
                              heroTag: null,
                              backgroundColor: const Color(0xffFFFFFF),
                              elevation: 0.0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
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
                                color: Theme.of(context).primaryColor,
                                size: 16.r,
                              ),
                            ),
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 23.w,
                            height: 23.h,
                            child: FloatingActionButton(
                              onPressed: () {},
                              mini: true,
                              heroTag: null,
                              backgroundColor: const Color(0xffFFFFFF),
                              elevation: 0.0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
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
                                color: Theme.of(context).primaryColor,
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
          SvgPicture.asset(
            "assets/images/delete.svg",
            width: 27.w,
            height: 27.h,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
