import 'package:dio/dio.dart';
import 'package:mobilicis_task/services/dio_client.dart';

class HomeService {
  final DioClient dioClient;

  HomeService(this.dioClient);

  Future<Response> getFaqs() async {
    return await dioClient.dio.get('/faq');
  }

  Future<Response> fetchProducts(Map<String, dynamic> filters) async {
    return await dioClient.dio.post('/filter', data: filters);
  }

  Future<Response> likeProduct(
      String csrfToken, String listingId, bool isFav) async {
    return await dioClient.dio.post('/favs',
        data: {"listingId": listingId, "isFav": isFav},
        options: Options(headers: {'X-Csrf-Token': csrfToken}));
  }

  Future<Response> fetchBrands() async {
    return await dioClient.dio.get('/makeWithImages');
  }

  Future<Response> fetchFilters() async {
    return await dioClient.dio.get('/showSearchFilters');
  }
}
