import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/products_model.dart';
import 'package:thimar_app/features/products_cubit/states.dart';


class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsStates());

  Future<void> getProducts({int? id}) async {
    emit(
      GetProductsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "categories/$id",
    );
    if (response.success) {
      final list = GetProductsModel.fromJson(response.response!.data).data;
      emit(
        GetProductsSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetProductsFailedState(),
      );
    }
  }
}
