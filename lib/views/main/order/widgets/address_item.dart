import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/models/address.dart';

class OrderConfirmationAddressItem extends StatelessWidget {
  final AddressModel item;

  const OrderConfirmationAddressItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 140.h,
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 16.h,
      ),
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
                padding: EdgeInsetsDirectional.only(
                  start: 16.w,
                ),
                child: Text(
                  item.type,
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
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
            ),
            child: Text(
              "العنوان : ${item.location}",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
            ),
            child: Text(
              "الوصف : ${item.description}",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
            ),
            child: Text(
              "رقم الجوال : ${item.phone}",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
