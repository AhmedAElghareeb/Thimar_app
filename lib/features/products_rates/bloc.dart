import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import '../../core/logic/dio_helper.dart';
import '../../models/products_rates.dart';
import 'events.dart';
import 'states.dart';

class ProductsRatesBloc
    extends Bloc<GetProductsRatesEvents, GetProductsRatesStates> {
  ProductsRatesBloc()
      : super(
          GetProductsRatesStates(),
        ) {
    on<GetProductsRatesEvent>(getRates);
    on<AddRateToProductEvent>(addRate);
  }

  Future<void> getRates(
      GetProductsRatesEvent event, Emitter<GetProductsRatesStates> emit) async {
    emit(
      ProductsRatesLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "products/${event.id}/rates",
    );
    if (response.success) {
      final list = ProductsRatesData.fromJson(response.response!.data).list;
      emit(
        ProductsRatesSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        ProductsRatesFailedState(),
      );
    }
  }

  Future<void> addRate(
      AddRateToProductEvent event, Emitter<GetProductsRatesStates> emit) async {
    emit(
      AddRateToProductLoadingState(),
    );

    final response = await DioHelper()
        .sendToServer(url: "client/products/${event.id}/rate", body: {
      "value": event.value,
      "comment": event.productComment!.text,
    });

    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      emit(
        AddRateToProductSuccessState(),
      );
    } else {
      emit(
        AddRateToProductFailedState(),
      );
    }
  }
}
