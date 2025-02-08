import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/service/home_service.dart';

class HomeRepo {
  final HomeService homeService = HomeService(DioClient());

  Future<List<dynamic>?> getFaqs() async {
    try {
      final response = await homeService.getFaqs();
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> fetchProducts(Map<String, dynamic> filters) async {
    try {
      final response = await homeService.fetchProducts(filters);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> likeProduct(
      String csrfToken, String listingId, bool isFav) async {
    try {
      await homeService.likeProduct(csrfToken, listingId, isFav);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>?> fetchBrands() async {
    try {
      final response = await homeService.fetchBrands();
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> fetchFilters() async {
    try {
      final response = await homeService.fetchFilters();
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
