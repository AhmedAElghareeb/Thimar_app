import 'package:thimar_app/models/category_products.dart';

class CategoryProductsStates{}

class CategoryProductsLoadingState extends CategoryProductsStates{}

class CategoryProductsSuccessState extends CategoryProductsStates{
  final List<ProductsData> list;

  CategoryProductsSuccessState({required this.list});
}

class CategoryProductsFailedState extends CategoryProductsStates{}