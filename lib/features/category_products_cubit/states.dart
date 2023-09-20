import 'package:thimar_app/models/category_products_model.dart';

class CategoryProductsStates{}

class CategoryProductsLoadingStates extends CategoryProductsStates{}

class CategoryProductsSuccessStates extends CategoryProductsStates{
  final List<ProductsData> list;

  CategoryProductsSuccessStates({required this.list});
}

class CategoryProductsFailedStates extends CategoryProductsStates{}