import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/models/category_products.dart';

import '../../models/search.dart';

class CategoryProductsStates {}

class CategoryProductsLoadingState extends CategoryProductsStates {}

class CategoryProductsSuccessState extends CategoryProductsStates {
  final List<ProductsData> list;

  CategoryProductsSuccessState({required this.list});
}

class CategoryProductsFailedState extends CategoryProductsStates {}

class GetSearchDataSuccessState extends CategoryProductsStates {
  final List<SearchResult> data;

  GetSearchDataSuccessState({required this.data});
}

class GetSearchDataFailedState extends CategoryProductsStates {}

class GetDataFromPaginationLoadingState extends CategoryProductsStates{}
class GetDataFromPaginationFailState extends CategoryProductsStates{
  final String msg;

  GetDataFromPaginationFailState({required this.msg}) {
    showSnackBar(msg);
  }
}

