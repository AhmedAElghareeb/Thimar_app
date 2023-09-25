import 'package:thimar_app/models/products_model.dart';

class ProductsStates{}

class GetProductsLoadingState extends ProductsStates{}

class GetProductsSuccessState extends ProductsStates{
  final List<HProductsData> list;

  GetProductsSuccessState({required this.list});
}

class GetProductsFailedState extends ProductsStates{}