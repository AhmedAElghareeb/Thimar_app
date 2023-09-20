import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/category_products_model.dart';
import 'package:thimar_app/features/category_products_cubit/states.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsStates> {
  CategoryProductsCubit() : super(CategoryProductsStates());

  void getCategoryProducts() async {
    emit(
      CategoryProductsLoadingStates(),
    );
    final response = await DioHelper().getFromServer(
      url: "categories/1",
    );
    if (response.success) {
      final list = CategoryProductsModel.fromJson(response.response!.data).data;
      emit(
        CategoryProductsSuccessStates(
          list: list,
        ),
      );
    } else {
      emit(CategoryProductsFailedStates(),);
    }
  }
}
