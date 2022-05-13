class TaskModel {
  int id;
  int driverId;
  int dispatcherId;
  int itemCount;
  int vendorId;
  int orderNumber;
  double price;
  double lon;
  double lat;
  String server;
  String driver;
  String vendor;
  String address;
  String branch;
  String start;
  String end;
  String clientName;
  String clientPhone;
  String comment;
  String status;


  TaskModel({
    required this.id,
    required this.server,
    required this.itemCount,
    required this.clientName,
    required this.clientPhone,
    required this.lon,
    required this.lat,
    required this.address,
    required this.price,
    required this.vendorId,
    required this.vendor,
    required this.driver,
    required this.branch,
    required this.comment,
    required this.dispatcherId,
    required this.driverId,
    required this.end,
    required this.orderNumber,
    required this.start,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    server: json["server"],
    itemCount: json["itemCount"],
    clientName: json["clientName"],
    clientPhone: json["clientPhone"],
    lon: json['lon'] == null ? 0.0 : json['lon'].toDouble(),
    lat: json['lat'] == null ? 0.0 : json['lat'].toDouble(),
    address: json["address"],
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
    vendorId: json["vendorId"],
    vendor: json["vendor"],
    driver: json["driver"],
    branch: json["branch"],
    comment: json["comment"],
    dispatcherId: json["dispatcherId"],
    driverId: json["driverId"],
    end: json["end"],
    orderNumber: json["orderNumber"],
    start: json["start"],
    status: json["status"],
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
    "vendorId": vendorId,
    "vendor": vendor,
    "driver": driver,
    "branch": branch,
    "comment": comment,
    "dispatcherId": dispatcherId,
    "driverId": driverId,
    "end": end,
    "orderNumber": orderNumber,
    "start": start,
    "status": status,
  };
}
