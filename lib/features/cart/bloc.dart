import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/models/cart.dart';
import 'package:thimar_app/views/main/home/home/view.dart';
import '../../core/logic/dio_helper.dart';
import 'events.dart';
import 'states.dart';
import 'dart:developer' as x;

class CartBloc extends Bloc<CartEvents, CartStates> {
  final couponController = TextEditingController();

  CartBloc() : super(CartStates()) {
    on<GetCartDataEvent>(getData);
    on<AddToCartDataEvent>(addData);
    on<UpdateCartDataEvent>(update);
    on<AddCouponEvent>(coupon);
  }

  bool isInit = true;

  void getCartCount() {
    DioHelper()
        .getFromServer(
      url: "client/cart",
    )
        .then((value) {
      if (value.success) {
        int itemCount = (value.response?.data['data'] as List).length ?? 0;
        setCartCount(itemCount);
      }
    });
  }

  Future<void> getData(GetCartDataEvent event, Emitter<CartStates> emit) async {
    if (isInit) {
      emit(
        GetCartDataLoadingState(),
      );
    }

    final response = await DioHelper().getFromServer(
      url: "client/cart",
    );

    if (response.success) {
      final list = CartData.fromJson(response.response!.data).data;
      isInit = false;
      emit(
        GetCartDataSuccessState(
          list: list,
          taxMsg: response.response!.data["vip_message"] ?? "",
          priceBefore:
              response.response!.data["total_price_before_discount"] ?? 0,
          discount: response.response!.data["total_discount"] ?? 0,
          deliveryCost: response.response!.data["delivery_cost"] ?? 0,
          priceWithVat: response.response!.data["total_price_with_vat"] ?? 0,
          vat: response.response!.data["vat"] ?? 0,
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
      AddToCartDataLoadingState(
        event.productId,
      ),
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
      setMainCartCount();

    } else {
      emit(
        AddToCartDataFailedState(
          msg: response.msg,
        ),
      );
    }
  }

  deleteItem(CartModel item, Function(bool) onSuccess) async {
    final response = await DioHelper().removeFromServer(
      url: "client/cart/delete_item/${item.id}",
    );
    if (response.success) {
      onSuccess(true);
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
    }
  }

  Future<void> update(
      UpdateCartDataEvent event, Emitter<CartStates> emit) async {
    emit(
      UpdateCartDataStateLoading(),
    );
    final response = await DioHelper().sendToServer(
        url: "client/cart/${event.id}",
        body: {"amount": event.amount, "_method": "PUT"});

    if (response.success) {
      emit(
        UpdateCartDataStateSuccess(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        UpdateCartDataStateFailed(),
      );
    }
  }

  Future<void> coupon(AddCouponEvent event, Emitter<CartStates> emit) async {
    emit(
      AddCouponLoadingState(),
    );

    final response =
        await DioHelper().sendToServer(url: "client/cart/apply_coupon", body: {
      "code": couponController.text,
    });

    if (response.success) {
      emit(
        AddCouponSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        AddCouponFailedState(),
      );
    }
  }
}


void setMainCartCount(){
  KiwiContainer().resolve<CartBloc>().getCartCount();
}