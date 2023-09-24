import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تواصل معنا"),
        leading: Padding(
          padding: EdgeInsets.all(10.w.h),
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
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 28.h,
          ),
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      "https://avatars.mds.yandex.net/get-images-cbir/3575263/TAWBr4l4--MB0MDPdegedQ807/ocr",
                      width: 342.w,
                      height: 198.h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 57.h,
                        right: 79.w,
                      ),
                      child: Image.network(
                        "https://www.360-ticketing.com/img/pin1.png",
                        width: 17.w,
                        height: 27.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 130.h, right: 15.w),
                      child: Container(
                        width: 312.w,
                        height: 119.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: const Color(
                            0xffFFFFFF,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xfff1f1f1,
                              ),
                              blurRadius: 10.r,
                              offset: Offset(0.w, 10.h),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icons/addressIcons/Location.svg",
                                    width: 12.w,
                                    height: 15.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    "13 شارع الملك فهد , جدة , المملكة العربية السعودية",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff091022,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icons/addressIcons/Calling.svg",
                                    width: 15.w,
                                    height: 15.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "96605487452+",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff091022,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icons/addressIcons/Message.svg",
                                    width: 15.w,
                                    height: 13.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    "info@thimar.com",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(
                                        0xff091022,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "أو يمكنك إرسال رسالة",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  width: 342.w,
                  height: 313.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 311.w,
                        height: 225.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppInput(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              labelText: "الإسم",
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppInput(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              labelText: "رقم الموبايل",
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppInput(
                              controller: subjectController,
                              labelText: "الموضوع",
                              minLines: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      AppButton(
                        onTap: () {},
                        text: "إرسال",
                        width: 311.w,
                        height: 60.h,
                        radius: 15.r,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
