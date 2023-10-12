import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/orders.dart';
import 'events.dart';
import 'states.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc() : super(OrdersStates()) {
    on<GetOrdersDataEvent>(getData);
    on<PostOrderDataEvent>(storeOrder);
  }

  Future<void> getData(
      GetOrdersDataEvent event, Emitter<OrdersStates> emit) async {
    emit(
      GetOrdersDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/orders/${event.type}",
    );
    if (response.success) {
      final list = OrdersData.fromJson(response.response!.data).data;
      emit(
        GetOrdersDataSuccessState(
          data: list,
        ),
      );
    } else {
      emit(
        GetOrdersDataFailedState(),
      );
    }
  }

  Future<void> storeOrder(
      PostOrderDataEvent event, Emitter<OrdersStates> emit) async {
    emit(
      PostOrdersDataLoadingState(),
    );

    final response =
        await DioHelper().sendToServer(url: "client/orders", body: {
      "address_id": event.addressModel!.id,
      "date": event.date,
      "time": event.time,
      "note": event.noteController!.text,
      "pay_type": event.payType,
      "transaction_id": event.transactionId,
      "coupon_code": event.couponCodeController!.text,
    });

    if (response.success) {
      emit(
        PostOrdersDataSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        PostOrdersDataFailedState(),
      );
    }
  }
}
