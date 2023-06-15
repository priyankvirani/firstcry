class ApiResponse<T> {
  Status? status;
  int? code;
  T? data;
  String? message;
  String? header;

  ApiResponse({this.status, this.code, this.data, this.message, this.header});

  @override
  String toString() {
    return "Status : $status \n Code : $code \n Message : $message \n Data : $data";
  }
}

enum Status { success, error }
