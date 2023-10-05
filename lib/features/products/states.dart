import 'package:thimar_app/models/products.dart';

class ProductsStates{}

class GetProductsLoadingState extends ProductsStates{}

class GetProductsSuccessState extends ProductsStates{
  final List<ProductsData> list;

  GetProductsSuccessState({required this.list});
}

class GetProductsFailedState extends ProductsStates{}