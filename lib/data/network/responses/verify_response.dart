class VerifyResponse {
  VerifyResponse({
    this.status,
    this.message,
    this.type,
    this.id,
  });

  int? status;
  String? message;
 String? type;
 int? id;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
    status: json["status"],
    message: json["message"],
    type: json["type"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "type": type,
    "id": id,
  };
}
