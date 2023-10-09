import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/models/cart.dart';
import '../../core/logic/dio_helper.dart';
import 'events.dart';
import 'states.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  CartBloc() : super(CartStates()) {
    on<GetCartDataEvent>(getData);
    on<AddToCartDataEvent>(addData);
    on<RemoveFromCartDataEvent>(removeData);
  }

  Future<void> getData(GetCartDataEvent event, Emitter<CartStates> emit) async {
    emit(
      GetCartDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/cart",
    );

    if (response.success) {
      final list = CartData.fromJson(response.response!.data).data;
      if (list.isEmpty) {
        showSnackBar(
          response.msg,
          typ: MessageType.warning,
        );
      }
      emit(
        GetCartDataSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetCartDataFailedState(),
      );
    }
  }

  Future<void> addData(
      AddToCartDataEvent event, Emitter<CartStates> emit) async {
    emit(
      AddToCartDataLoadingState(),
    );

    final response = await DioHelper().sendToServer(url: "client/cart", body: {
      "product_id": event.productId,
      "amount": event.amount,
    });

    if (response.success) {
      emit(
        AddToCartDataSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        AddToCartDataFailedState(
          msg: response.msg,
        ),
      );
    }
  }

  Future<void> removeData(
      RemoveFromCartDataEvent event, Emitter<CartStates> emit) async {
    emit(
      RemoveFromCartDataLoadingState(),
    );

    final response = await DioHelper().removeFromServer(
      url: "client/cart/delete_item/${event.id}",
    );

    if (response.success) {
      emit(
        RemoveFromCartDataSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        RemoveFromCartDataFailedState(
          msg: response.msg,
        ),
      );
    }
  }
}
