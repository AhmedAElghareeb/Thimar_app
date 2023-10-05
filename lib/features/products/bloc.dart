import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/products.dart';
import 'events.dart';
import 'states.dart';

class ProductsDataBloc extends Bloc<ProductsEvents, ProductsStates>{
  ProductsDataBloc() : super(ProductsStates(),){
    on<GetProductsDataEvent>(getProducts);
  }


  Future<void> getProducts(GetProductsDataEvent event, Emitter<ProductsStates> emit) async {
    emit(
      GetProductsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "categories/${event.id}",
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