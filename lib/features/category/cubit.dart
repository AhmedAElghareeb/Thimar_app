import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/category_model.dart';
import 'package:thimar_app/features/category/states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryStates());

void getCategories() async {
  emit(
    CategoryLoadingState(),
  );
  final response = await DioHelper().getFromServer(
    url: "categories",
  );
  if (response.success) {
    final list = CategoriesModel.fromJson(response.response!.data);
    emit(
      CategorySuccessState(
        list: list.data,
      ),
    );
  } else {
    emit(CategoryFailedState(),);
  }
}
}
