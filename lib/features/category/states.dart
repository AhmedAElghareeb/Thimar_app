import 'package:thimar_app/models/category.dart';

class CategoriesStates{}

class CategoryLoadingState extends CategoriesStates{}

class CategorySuccessState extends CategoriesStates{
  final List<CategoriesData> list;

  CategorySuccessState({required this.list});
}

class CategoryFailedState extends CategoriesStates{}