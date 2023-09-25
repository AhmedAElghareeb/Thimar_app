import 'package:thimar_app/models/category_model.dart';

class CategoryStates{}

class CategoryLoadingState extends CategoryStates{}

class CategorySuccessState extends CategoryStates{
  final List<CategoriesData> list;

  CategorySuccessState({required this.list});
}

class CategoryFailedState extends CategoryStates{}