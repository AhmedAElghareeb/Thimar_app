import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/category_model.dart';
import 'package:thimar_app/features/category_cubit/states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryStates());

void getCategories() async {
  emit(
    CategoryLoadingStates(),
  );
  final response = await DioHelper().getFromServer(
    url: "categories",
  );
  if (response.success) {
    print("success",);
    final list = CategoriesModel.fromJson(response.response!.data).data;
    print("success1235",);
    emit(
      CategorySuccessState(
        list: list,
      ),
    );
  } else {
    emit(CategoryFailedState(),);
  }
}
}
