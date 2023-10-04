import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';

class ConvertToVip extends StatelessWidget {
  const ConvertToVip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تحويل لحساب VIP",
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
          padding: EdgeInsetsDirectional.only(
            start: 30.w,
            end: 30.w,
          ),
          children: [
            Image.network(
              "https://jpsrenewableenergy.co.uk/wp-content/uploads/2019/11/jps-20year-inverter-guarantee.png",
              width: 82.w,
              height: 102.h,
            ),
            SizedBox(
              height: 13.h,
            ),
            Center(
              child: Text(
                "حساب Vip",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                "150 ر.س/شهريا",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const Center(
              child: Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 12.r,
                  child: Icon(
                    Icons.done,
                    color: const Color(
                      0xffFFFFFF,
                    ),
                    size: 18.r,
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "تسوق من المتجر ودفع التكاليف شهريا",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            AppButton(
              onTap: () {},
              text: "طلب تحويل",
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
