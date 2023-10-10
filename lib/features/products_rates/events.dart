import 'package:flutter/material.dart';

class GetProductsRatesEvents {}

class GetProductsRatesEvent extends GetProductsRatesEvents {
  final int id;

  GetProductsRatesEvent({required this.id});
}

class AddRateToProductEvent extends GetProductsRatesEvents {

  final int id, value;
  TextEditingController? productComment;

  AddRateToProductEvent({required this.id, required this.value}) {
    productComment = TextEditingController();
  }
}
