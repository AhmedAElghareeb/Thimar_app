import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';

class RechargeNow extends StatefulWidget {
  const RechargeNow({super.key});

  @override
  State<RechargeNow> createState() => _RechargeNowState();
}

class _RechargeNowState extends State<RechargeNow> {
  final amountInfo = TextEditingController();
  final nameOfCard = TextEditingController();
  final numOfCard = TextEditingController();
  final cardExpireDate = TextEditingController();
  final serialNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "شحن الان",
        ),
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
            vertical: 20.h
          ),
          children: [
            Text(
              "معلومات المبلغ",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            AppInput(
              controller: amountInfo,
              keyboardType: TextInputType.number,
              isFilled: true,
              labelText: "المبلغ الخاص بك",
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "معلومات البطاقة",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            AppInput(
              controller: nameOfCard,
              keyboardType: TextInputType.name,
              isFilled: true,
              labelText: "الاسم",
            ),
            SizedBox(
              height: 20.h,
            ),
            AppInput(
              controller: numOfCard,
              keyboardType: TextInputType.number,
              isFilled: true,
              labelText: "رقم البطاقة الائتمانية",
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 162.w,
                  height: 59.h,
                  child: AppInput(
                    controller: cardExpireDate,
                    keyboardType: TextInputType.datetime,
                    isFilled: true,
                    labelText: "تاريخ الانتهاء",
                  ),
                ),
                SizedBox(
                  width: 162.w,
                  height: 59.h,
                  child: AppInput(
                    controller: serialNum,
                    keyboardType: TextInputType.number,
                    isFilled: true,
                    labelText: "الرقم المتسلسل",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            AppButton(
              onTap: () {},
              text: "دفع",
              width: 343.w,
              height: 60.h,
              radius: 15.r,
            ),
          ],
        ),
      ),
    );
  }
}
