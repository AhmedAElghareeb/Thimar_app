import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/product_details.dart';
import 'events.dart';
import 'states.dart';

class ProductDetailsBloc extends Bloc<ShowProductsDetailsEvents, ShowProductsDetails>{
  ProductDetailsBloc() : super(ShowProductsDetails(),){
    on<GetProductsDetailsEvent>(showProducts);
  }

  Future<void> showProducts(GetProductsDetailsEvent event, Emitter<ShowProductsDetails> emit) async {
    emit(
      ShowProductsDetailsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "products/${event.id}",
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