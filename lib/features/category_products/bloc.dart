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

  final List<ProductsData> productsList = [];

  int? pageNumber = 1;

  CategoryProductBloc()
      : super(
          CategoryProductsStates(),
        ) {
    on<GetCategoryProductsDataEvent>(getCategoryProducts);
    on<GetSearchDataEvent>(getSearchData);
  }

  void getCategoryProducts(GetCategoryProductsDataEvent event,
      Emitter<CategoryProductsStates> emit) async {
    if (event.fromPagination) {
      emit(
        GetDataFromPaginationLoadingState(),
      );
    } else {
      emit(
        CategoryProductsLoadingState(),
      );
    }
    final response = await DioHelper().getFromServer(
      url: "products?page=$pageNumber",
    );
    if (response.success) {
      final list = CategoryProductsModel.fromJson(response.response!.data);
      if (list.data.isNotEmpty) {
        pageNumber = response.response!.data['links']['next'];
        productsList.addAll(
          list.data,
        );
      }
      emit(
        CategoryProductsSuccessState(
          list: productsList,
        ),
      );
    } else {
      if (event.fromPagination) {
        emit(
          GetDataFromPaginationFailState(
            msg: response.msg,
          ),
        );
      } else {
        emit(
          CategoryProductsFailedState(),
        );
      }
    }
  }

  void getSearchData(
      GetSearchDataEvent event, Emitter<CategoryProductsStates> emit) async {
    final response = await DioHelper().getFromServer(url: "search", params: {
      "keyword": searchController.text,
    });
    if (response.success) {
      final data =
          SearchData.fromJson(response.response!.data).data.searchResult;
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
