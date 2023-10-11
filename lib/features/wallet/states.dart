import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/wallet.dart';

class WalletStates {}

class GetWalletDataLoadingState extends WalletStates {}

class GetWalletDataSuccessState extends WalletStates {
  final List<WalletModel> list;
  num wallet;

  GetWalletDataSuccessState({
    required this.list,
    required this.wallet,
  });
}

class GetWalletDataFailedState extends WalletStates {}

class GetWalletTransactionsDataLoadingState extends WalletStates {}

class GetWalletTransactionsDataSuccessState extends WalletStates {
  final List<WalletModel> list;

  GetWalletTransactionsDataSuccessState({
    required this.list,
  });
}

class GetWalletTransactionsDataFailedState extends WalletStates {}

class PostWalletChargeLoadingState extends WalletStates {}

class PostWalletChargeSuccessState extends WalletStates {
  final String msg;

  PostWalletChargeSuccessState({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class PostWalletChargeFailedState extends WalletStates {
  final String msg;

  PostWalletChargeFailedState({required this.msg}) {
    showSnackBar(msg);
  }
}
