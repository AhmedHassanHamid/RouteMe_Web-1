class SuccessfulResponse {
  SuccessfulResponse({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory SuccessfulResponse.fromJson(Map<String, dynamic> json) =>
      SuccessfulResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
