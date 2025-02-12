import 'package:mobilicis_task/models/brand_model.dart';
import 'package:mobilicis_task/models/faq_model.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/service/home_service.dart';

class HomeRepo {
  final HomeService homeService = HomeService(DioClient());

  Future<FaqModelResponse?> getFaqs() async {
    return await homeService.getFaqs();
  }

  Future<BrandModelResponse?> fetchBrands() async {
    return await homeService.fetchBrands();
  }

  Future<FilterModel?> fetchFilters() async {
    return await homeService.fetchFilters();
  }

  Future<FilterModel?> fetchProducts(Map<String, dynamic> filters) async {
    return await homeService.fetchProducts(filters);
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
}
