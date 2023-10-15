import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/models/wallet.dart';
import 'events.dart';
import 'states.dart';

class WalletBloc extends Bloc<WalletEvents, WalletStates> {
  final amountController = TextEditingController();

  WalletBloc() : super(WalletStates()) {
    on<GetWalletDataEvent>(getData);
    on<GetWalletTransactionsDataEvent>(getTransaction);
    on<PostChargeWalletEvent>(charge);
  }

  Future<void> getData(
      GetWalletDataEvent event, Emitter<WalletStates> emit) async {
    emit(
      GetWalletDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "wallet",
    );

    if (response.success) {
      final list = List.from(response.response!.data['data'] ?? [])
          .map((e) => WalletModel.fromJson(e))
          .toList();
      emit(
        GetWalletDataSuccessState(
          list: list,
          wallet: response.response!.data["wallet"],
        ),
      );
    } else {
      emit(
        GetWalletDataFailedState(),
      );
    }
  }

  Future<void> getTransaction(
      GetWalletTransactionsDataEvent event, Emitter<WalletStates> emit) async {
    emit(
      GetWalletTransactionsDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "wallet/get_wallet_transactions",
    );

    if (response.success) {
      final list = WalletData.fromJson(response.response!.data).data;
      emit(
        GetWalletTransactionsDataSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetWalletTransactionsDataFailedState(),
      );
    }
  }

  Future<void> charge(
      PostChargeWalletEvent event, Emitter<WalletStates> emit) async {
    emit(
      PostWalletChargeLoadingState(),
    );

    final response =
        await DioHelper().sendToServer(url: "wallet/charge", body: {
      "amount": event.amount,
      "transaction_id": "1111",
    });

    if (response.success) {
      emit(
        PostWalletChargeSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        PostWalletChargeFailedState(
          msg: response.msg,
        ),
      );
    }
  }
}
