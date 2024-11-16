import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/bottom_sheet.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/models/orders.dart';
import 'package:thimar_app/views/main/view.dart';
import '../../models/order_details.dart';
import '../cart/bloc.dart';
import 'events.dart';
import 'states.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc() : super(OrdersStates()) {
    on<GetOrdersDataEvent>(getData);
    on<PostOrderDataEvent>(storeOrder);
    on<GetOrderDetailsDataEvent>(getDetails);
    on<CancelOrderDataEvent>(cancelOrder);
  }

  bool isLoading = true;

  Future<void> getData(
      GetOrdersDataEvent event, Emitter<OrdersStates> emit) async {
    if (isLoading) {
      emit(
        GetOrdersDataLoadingState(),
      );
    }

    final response = await DioHelper().getFromServer(
      url: "client/orders/${event.type}",
    );
    if (response.success) {
      final list = OrdersData.fromJson(response.response!.data).data;
      isLoading = false;
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
      onShowBottomSheet(
        navigatorKey.currentContext!,
        maxHeight: 500.h,
        bottomSheet: BottomSheetWidget(
          child: Column(
            children: [
              SvgPicture.asset('assets/images/thanks_for_order.svg'),
              SizedBox(height: 20.h),
              Text(
                response.response!.data["message"],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Theme.of(navigatorKey.currentContext!).primaryColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'يمكنك مراجعة حالة الطلب او الرجوع للرئيسية..',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.grey.shade700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () => navigateTo(const HomeView(index: 1)),
                      text: "طلباتى",
                      radius: 15.r,
                      width: 343.w,
                      height: 60.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: AppButton(
                      onTap: () => navigateTo(const HomeView(index: 0)),
                      text: "العودة للرئيسية",
                      radius: 15.r,
                      width: 343.w,
                      height: 60.h,
                      backColor: Colors.white,
                      textColor:
                          Theme.of(navigatorKey.currentContext!).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      emit(PostOrdersDataSuccessState());
      setMainCartCount();
    } else {
      emit(PostOrdersDataFailedState(msg: response.msg));
    }
  }

  Future<void> getDetails(
      GetOrderDetailsDataEvent event, Emitter<OrdersStates> emit) async {
    emit(
      GetOrderDetailsDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/orders/${event.num}",
    );
    if (response.success) {
      final data = OrderDetailsData.fromJson(response.response!.data).data;
      emit(
        GetOrderDetailsDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetOrderDetailsDataFailedState(),
      );
    }
  }

  Future<void> cancelOrder(
      CancelOrderDataEvent event, Emitter<OrdersStates> emit) async {
    emit(CancelOrdersDataLoadingState());

    final response = await DioHelper().sendToServer(
      url: "client/orders/${event.orderNum}/cancel",
    );

    if (response.success) {
      emit(CancelOrdersDataSuccessState(msg: response.msg));
      navigateTo(const HomeView(index: 1));
    } else {
      emit(
        CancelOrdersDataFailedState(),
      );
    }
  }
}
