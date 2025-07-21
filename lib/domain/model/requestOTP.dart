
class RequestOTP {
  RequestOTP({required this.data, required this.status, required this.message});
  late final String data;
  late final String status;
  late final String message;

  RequestOTP.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }
}
