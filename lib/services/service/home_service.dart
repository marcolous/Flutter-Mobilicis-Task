import 'package:dio/dio.dart';
import 'package:mobilicis_task/models/brand_model.dart';
import 'package:mobilicis_task/models/faq_model.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/utils/widgets/app_flutter_toast.dart';

class HomeService {
  final DioClient dioClient;

  HomeService(this.dioClient);

  Future<FaqModelResponse?> getFaqs() async {
    try {
      final res = await dioClient.dio.get('/faq');
      if (res.statusCode == 200) {
        final faq = FaqModelResponse.fromJson(res.data);
        return faq;
      } else {
        AppFlutterToast.flutterToastError('Couldn\'t fetch FAQs');
      }
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Couldn\'t fetch FAQs');
      return null;
    }
    return null;
  }

  Future<BrandModelResponse?> fetchBrands() async {
    try {
      final res = await dioClient.dio.get('/makeWithImages');
      if (res.statusCode == 200) {
        final brand = BrandModelResponse.fromJson(res.data);
        return brand;
      } else {
        AppFlutterToast.flutterToastError('Couldn\'t fetch Brands');
      }
    } catch (e) {
      AppFlutterToast.flutterToastError('Couldn\'t fetch Brands');
      print(e);
      return null;
    }
    return null;
  }

  Future<FilterModel?> fetchFilters() async {
    try {
      final res = await dioClient.dio.get('/showSearchFilters');
      if (res.statusCode == 200) {
        final fliter = FilterModel.fromJson(res.data['dataObject']);
        return fliter;
      } else {
        AppFlutterToast.flutterToastError('Couldn\'t fetch Filters');
      }
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Couldn\'t fetch Filters');
      return null;
    }
    return null;
  }

  Future<FilterModel?> fetchProducts(Map<String, dynamic> filters) async {
    try {
      final res = await dioClient.dio.post('/filter', data: filters);
    } catch (e) {}
    return null;
  }

  Future<Response> likeProduct(
      String csrfToken, String listingId, bool isFav) async {
    return await dioClient.dio.post('/favs',
        data: {"listingId": listingId, "isFav": isFav},
        options: Options(headers: {'X-Csrf-Token': csrfToken}));
  }
}
