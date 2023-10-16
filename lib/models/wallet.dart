import 'orders.dart';

class WalletData {
  late final List<WalletModel> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  WalletData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => WalletModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }
}

class WalletModel {
  late final int id;
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
  late final List<ImageModel> images;

  WalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    amount = json['amount'] ?? 0;
    beforeCharge = json['before_charge'] ?? 0;
    images = List.from(json['images'] ?? []).map((e) => ImageModel.fromJson(e)).toList();
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

class Links {
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'] ?? "";
    last = json['last'] ?? "";
    prev = null;
    next = null;
  }
}

class Meta {
  late final num currentPage;
  late final num from;
  late final num lastPage;
  late final List<Links> links;
  late final String path;
  late final num perPage;
  late final num to;
  late final num total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    from = json['from'] ?? 0;
    lastPage = json['last_page'] ?? 0;
    links =
        List.from(json['links'] ?? []).map((e) => Links.fromJson(e)).toList();
    path = json['path'] ?? "";
    perPage = json['per_page'] ?? 0;
    to = json['to'] ?? 0;
    total = json['total'] ?? 0;
  }
}
