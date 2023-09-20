import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/product_details_model.dart';
import 'package:thimar_app/features/products_details/states.dart';


class ShowProductsDetailsCubit extends Cubit<ShowProducts> {
  ShowProductsDetailsCubit()
      : super(
          ShowProducts(),
        );

  Future<void> showProducts({int? id}) async {
    emit(
      ShowProductsDetailsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "products/$id",
    );
    if (response.success) {
      final model = ProductsDetails.fromJson(response.response!.data).data;
      emit(
        ShowProductsDetailsSuccessState(
          model: model,
        ),
      );
    } else {
      emit(
        ShowProductsDetailsFailedState(),
      );
    }
  }
}
