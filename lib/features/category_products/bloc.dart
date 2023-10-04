import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/category_products_model.dart';
import 'events.dart';
import 'states.dart';

class CategoryProductBloc extends Bloc<CategoryProductsEvents, CategoryProductsStates>{
  CategoryProductBloc() : super(CategoryProductsStates(),){
    on<GetCategoryProductsDataEvent>(getCategoryProducts);
  }


  void getCategoryProducts(GetCategoryProductsDataEvent event, Emitter<CategoryProductsStates> emit) async {
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
      emit(CategoryProductsFailedState(),);
    }
  }
}