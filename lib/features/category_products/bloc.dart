import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/models/search.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/category_products.dart';
import 'events.dart';
import 'states.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductsEvents, CategoryProductsStates> {

  final searchController = TextEditingController();

  CategoryProductBloc()
      : super(
          CategoryProductsStates(),
        ) {
    on<GetCategoryProductsDataEvent>(getCategoryProducts);
    on<GetSearchDataEvent>(getSearchData);
  }

  void getCategoryProducts(GetCategoryProductsDataEvent event,
      Emitter<CategoryProductsStates> emit) async {
    emit(
      CategoryProductsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "products",
    );
    if (response.success) {
      final list = CategoryProductsModel.fromJson(response.response!.data);
      emit(
        CategoryProductsSuccessState(
          list: list.data,
        ),
      );
    } else {
      emit(
        CategoryProductsFailedState(),
      );
    }
  }

  void getSearchData(
      GetSearchDataEvent event, Emitter<CategoryProductsStates> emit) async {
    final response = await DioHelper().getFromServer(
      url: "search/${event.keyWord}",
      params: {
        "keyword" : searchController.text,
      }
    );
    if (response.success) {
      final data = SearchData.fromJson(response.response!.data).data.searchResult;
      emit(
        GetSearchDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetSearchDataFailedState(),
      );
    }
  }
}
