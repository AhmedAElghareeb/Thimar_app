class WalletModel {
  late final num id;
  late final num amount;
  late final num beforeCharge;
  late final num afterCharge;
  late final String date;
  late final String statusTrans;
  late final String status;
  late final String transactionType;
  late final String modelType;
  late final num modelId;
  late final String state;

  WalletModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    amount = json['amount'] ?? 0;
    beforeCharge = json['before_charge'] ?? 0;
    afterCharge = json['after_charge'] ?? 0;
    date = json['date'] ?? "";
    statusTrans = json['status_trans'] ?? "";
    status = json['status'] ?? "";
    transactionType = json['transaction_type'] ?? "";
    modelType = json['model_type'] ?? "";
    modelId = json['model_id'] ?? 0;
    state = json['state'] ?? "";
  }
}