import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import '../../models/category.dart';
import 'events.dart';
import 'states.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates>
{
  CategoriesBloc() : super(CategoriesStates(),){
    on<GetCategoriesEvent>(getCategories);
  }

  void getCategories(GetCategoriesEvent event, Emitter<CategoriesStates> emit) async {
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