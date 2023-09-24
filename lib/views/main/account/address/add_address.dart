import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final phoneNumber = TextEditingController();
  final discribtion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إضافة عنوان",
        ),
        leading: Padding(
          padding: EdgeInsets.all(
            10.w.h,
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
                padding: EdgeInsets.only(
                  right: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.w.h,
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
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      "https://avatars.mds.yandex.net/get-images-cbir/113991/6uoKV1t_su-MpnNUMnTUmA6813/ocr",
                      width: 375.w,
                      height: 550.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 110.w,
                        top: 75.h,
                        right: 215.w,
                      ),
                      child: Image.network(
                        "https://www.360-ticketing.com/img/pin1.png",
                        width: 29.w,
                        height: 46.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 206.h,
                      ),
                      child: Container(
                        width: 350.w,
                        height: 505.h,
                        margin: EdgeInsets.symmetric(horizontal: 16.w,),
                        padding: EdgeInsets.symmetric(horizontal: 16.w,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: const Color(
                            0xffFFFFFF,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                              ),
                              child: Container(
                                width: 342.w,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                  color: const Color(
                                    0xffFFFFFF,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.1.r,
                                      color: const Color(
                                        0xffeeeeee,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 12.w,
                                    left: 10.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "نوع العنوان",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(
                                            0xff8B8B8B,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      Container(
                                        width: 72.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11.r),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "المنزل",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.sp,
                                              color: const Color(
                                                0xffFFFFFF,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Container(
                                        width: 72.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11.r),
                                          color: const Color(
                                            0xffffffff,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.2.r,
                                              color: const Color(
                                                0xff9b9b9b,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "العمل",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.sp,
                                              color: const Color(
                                                0xff8B8B8B,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 14.h,),
                            AppInput(
                              controller: phoneNumber,
                              keyboardType: TextInputType.phone,
                              labelText: "أدخل رقم الجوال",
                            ),
                            SizedBox(height: 14.h,),
                            AppInput(
                              controller: discribtion,
                              labelText: "الوصف",
                            ),
                            SizedBox(
                              height: 49.h,
                            ),
                            AppButton(
                              onTap: () {},
                              text: "إضافة العنوان",
                              width: 342.w,
                              height: 60.h,
                              radius: 15.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
