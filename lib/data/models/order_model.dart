class OrderModel {
  int id;
  int itemCount;
  String server;
  String clientName;
  String clientPhone;
  double lon;
  double lat;
  String address;
  double price;
  String vendor;
  int vendorId;
  String branch;
  String comment;
  String state;

  OrderModel({
    required this.id,
    required this.server,
    required this.itemCount,
    required this.clientName,
    required this.clientPhone,
    required this.lon,
    required this.lat,
    required this.address,
    required this.price,
    required this.vendor,
    required this.vendorId,
    required this.branch,
    required this.comment,
    required this.state,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    server: json["server"],
    itemCount: json["itemCount"],
    clientName: json["clientName"],
    clientPhone: json["clientPhone"],
    lon: json['lon'] == null ? 0.0 : json['lon'].toDouble(),
    lat: json['lat'] == null ? 0.0 : json['lat'].toDouble(),
    address: json["address"],
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
    vendor: json["vendor"],
    vendorId: json["vendorId"],
    branch: json["branch"],
    comment: json["comment"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "server": server,
    "itemCount": itemCount,
    "clientName": clientName,
    "clientPhone": clientPhone,
    "lon": lon,
    "lat": lat,
    "address": address,
    "price": price,
    "vendor": vendor,
    "vendorId": vendorId,
    "branch": branch,
    "comment": comment,
    "state": state,
  };
}
