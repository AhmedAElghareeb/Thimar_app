class WalletEvents {}

class GetWalletDataEvent extends WalletEvents {}

class GetWalletTransactionsDataEvent extends WalletEvents {}

class PostChargeWalletEvent extends WalletEvents {
  final String amount;

  PostChargeWalletEvent({required this.amount});
}