import 'package:flutter/material.dart';
import 'package:thimar_app/models/address.dart';

class OrdersEvents {}

class GetOrdersDataEvent extends OrdersEvents {
  final String type;

  GetOrdersDataEvent({required this.type});
}

class PostOrderDataEvent extends OrdersEvents {
  AddressModel? addressModel;
  TextEditingController? noteController, couponCodeController;
  String  payType, transactionId;
  String ?date, time;
  PostOrderDataEvent(
      {
      this.date ,
      this.time,
      this.payType = 'cash',
      this.transactionId =''}) {
    noteController = TextEditingController();
    couponCodeController = TextEditingController();
  }
}

class GetOrderDetailsDataEvent extends OrdersEvents {
  final int num;

  GetOrderDetailsDataEvent({required this.num});
}

class CancelOrderDataEvent extends OrdersEvents {
  final num orderNum;

  CancelOrderDataEvent({required this.orderNum});
}