import 'package:thimar_app/models/product_details.dart';

class ShowProductsDetails{}

class ShowProductsDetailsLoadingState extends ShowProductsDetails{}

class ShowProductsDetailsSuccessState extends ShowProductsDetails{
  final ProductDetailsData model;

  ShowProductsDetailsSuccessState({required this.model});
}

class ShowProductsDetailsFailedState extends ShowProductsDetails{}