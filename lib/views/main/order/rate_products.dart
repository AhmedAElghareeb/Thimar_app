import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';

class RateProducts extends StatelessWidget {
  const RateProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تقييم المنتجات",
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
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 41.h,
        ),
        children: [
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _Item(),
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(
              height: 16.h,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          AppButton(
            onTap: () {},
            text: "تقييم",
            width: 343.w,
            height: 60.h,
            radius: 15.r,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final productComment = TextEditingController();

  _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15.r),
        color: const Color(
          0xffffffff,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.r,
            color: const Color(
              0xfff5f5f5,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 8.h,
            ),
            child: Row(
              children: [
                Image.network(
                  "https://www.seeds-gallery.com/2330-large_default/moneymaker-tomato-seeds.jpg",
                  width: 75.w,
                  height: 64.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "طماطم",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "السعر / 1كجم",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(
                          0xff808080,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "45 ر.س",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "56 ر.س",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star,
                color: Color(0xffFF9529),
              ),
              Icon(
                Icons.star_border,
                color: Color(
                  0xffD5D5D5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 11.w,
            ),
            child: AppInput(
              controller: productComment,
              labelText: "تعليق المنتج",
              minLines: 3,
              maxLines: 7,
            ),
          ),
        ],
      ),
    );
  }
}
