class OrderModel {
  OrderModel(
      this.id,
      this.orderName,
      this.itemCount,
      this.clientName,
      this.clientPhone,
      this.clientLocation,
      this.orderPrice,
      this.vendor,
      this.branch,
      this.comment,
      this.state);
  final String id;

  final String orderName;
  final String itemCount;
  final String clientName;
  final String clientPhone;
  final String clientLocation;
  final String orderPrice;
  final String vendor;
  final String branch;
  final String comment;
  final String state;

  factory OrderModel.fromJson(json) {
    return OrderModel(
        json['id'].toString(),
        json['orderName'] ?? '',
        json['itemCount'].toString(),
        json['clientName'] ?? '',
        json['clientPhone'] ?? '',
        (json['lon'].toString()) + "," + json['lat'].toString(),
        json['price'].toString(),
        json['vendorId'].toString(),
        json['branchId'].toString(),
        json['comment'] ?? '',
        json['state'] ?? '');
  }
}
