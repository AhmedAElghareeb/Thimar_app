import 'package:thimar_app/models/category_products_model.dart';

class CategoryProductsStates{}

class CategoryProductsLoadingState extends CategoryProductsStates{}

class CategoryProductsSuccessState extends CategoryProductsStates{
  final List<ProductsData> list;

  CategoryProductsSuccessState({required this.list});
}

class CategoryProductsFailedState extends CategoryProductsStates{}