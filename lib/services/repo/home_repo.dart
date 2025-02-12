import 'package:mobilicis_task/models/brand_model.dart';
import 'package:mobilicis_task/models/faq_model.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/models/product_model.dart';
import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/service/home_service.dart';

class HomeRepo {
  final HomeService homeService = HomeService(DioClient());

  Future<FaqModelResponse?> getFaqs() async {
    return await homeService.getFaqs();
  }

  Future<List<BrandModel>?> fetchBrands() async {
    return await homeService.fetchBrands();
  }

  Future<FilterModel?> fetchFilters() async {
    return await homeService.fetchFilters();
  }

  Future<List<ProductModel>?> fetchAllProducts() async {
    return await homeService.fetchAllProducts();
  }

  Future<List<ProductModel>?> fetchFilteredProducts(FilterModel filter) async {
    return await homeService.fetchFilteredProducts(filter);
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
