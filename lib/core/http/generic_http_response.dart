class GenericHttpResponse {
  bool success;
  int? status;
  String? message;
  dynamic body;
  dynamic error;

  GenericHttpResponse({
    this.success = true,
    this.status = 200,
    this.message = 'ok',
    this.body,
    this.error,
  });
}
