import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 21.h,
          ),
          children: [
            Container(
              height: 109.h,
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
                              "طلب #4587",
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
                              "27,يونيو,2021",
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 11.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(7.r),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.13),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "180ر.س",
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
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            3,
                            (index) => Container(
                              width: 25.w,
                              height: 25.h,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsetsDirectional.only(
                                end: 3.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(7.r),
                                border: Border.all(
                                  color: const Color(
                                    0xff61B80C,
                                  ).withOpacity(0.06),
                                ),
                              ),
                              child: Image.network(
                                "https://avatars.mds.yandex.net/i?id=1cf01f05034f49faab8c420bdbb317165b831aee-4841096-images-thumbs&ref=rim&n=33&w=236&h=200",
                                width: 25.w,
                                height: 25.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 25.w,
                            height: 25.h,
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsetsDirectional.only(
                              end: 3.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(7.r),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.13),
                            ),
                            child: Center(
                              child: Text(
                                "+2",
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
                      Container(
                        width: 25.w,
                        height: 25.h,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsetsDirectional.only(
                          end: 3.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(7),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.13),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14.r,
                            color: Theme.of(context).primaryColor,
                          ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 83.h,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المنزل",
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
                            "شقة 40",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(
                                0xff999797,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "شارع العليا الرياض 12521 السعودية",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(
                                0xff000000,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        "https://avatars.mds.yandex.net/get-images-cbir/1355359/FinMwbTflOGvNBLnYfRHOg1684/ocr",
                        width: 72.w,
                        height: 62.h,
                      ),
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
                  height: 148.h,
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
                          SvgPicture.asset(
                            "assets/images/visa_colored.svg",
                            width: 50.w,
                            height: 15.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          bottom: 16.h,
        ),
        height: 60.h,
        child: FilledButton(
          onPressed: () {},
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
      ),
    );
  }
}
