import '../configs/api_endpoints.dart';
import '../networking/api_response.dart';
import '../networking/dio_client.dart';

class ApiProvider {
  late DioClient dioClient;

  Future<ApiResponse> login(Map<String, dynamic> params) async {
    dioClient = DioClient();
    final response = await dioClient.post(ApiEndpoints.login, data: params);
    return response;
  }

  Future<ApiResponse> getProducts() async {
    dioClient = DioClient();
    final response = await dioClient.get(ApiEndpoints.product);
    return response;
  }
}
