import 'package:thimar_app/models/product_details_model.dart';

class ShowProducts{}

class ShowProductsDetailsLoadingState extends ShowProducts{}

class ShowProductsDetailsSuccessState extends ShowProducts{
  final ProductDetailsData model;

  ShowProductsDetailsSuccessState({required this.model});
}

class ShowProductsDetailsFailedState extends ShowProducts{}