import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/dot_button.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/account/address/add_address.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "العناوين",
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
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 28.h,
          ),
          children: [
            Column(
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const _Item(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.h,
                  ),
                  itemCount: 4,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DotButton(
                  text: "إضافة عنوان",
                  onTap: () {
                    navigateTo(
                      const AddAddress(),
                    );
                  },
                ),
              ],
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
      width: 343.w,
      height: 97.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: const Color(
          0xffffffff,
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 16.w,
                ),
                child: Text(
                  "المنزل",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 217.w,
              ),
              Padding(
                padding: EdgeInsets.all(5.w.h),
                child: SvgPicture.asset(
                  "assets/images/icons/addressIcons/delete.svg",
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.w.h),
                child: SvgPicture.asset(
                  "assets/images/icons/addressIcons/edit.svg",
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              "العنوان : 119 طريق الملك عبدالعزيز",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              "الوصف",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: const Color(
                  0xff999797,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              "رقم الجوال",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: const Color(
                  0xff999797,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
