import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilicis_task/models/brand_model.dart';
import 'package:mobilicis_task/models/faq_model.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/models/product_model.dart';
import 'package:mobilicis_task/services/repo/home_repo.dart';

part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    FilterModel? filters,
    FaqModelResponse? faqs,
    List<BrandModel>? brands,
    List<ProductModel>? products,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        filters: FilterModel(),
        faqs: const FaqModelResponse(),
        brands: [],
        products: [],
      );
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    fetchData();
  }
  HomeRepo repo = HomeRepo();

  Future<void> fetchData() async {
    await fetchFilters();
    await fetchBrands();
    await fetchFAQs();
    await fetchAllProducts();
  }

  FilterModel model = FilterModel();
  FilterModel? get filter => state.filters;
  List<ProductModel>? get products => state.products;

  Future<void> fetchAllProducts() async {
    final products = await repo.fetchAllProducts();
    if (products != null) {
      emit(state.copyWith(products: products));
    }
  }

  Future<void> fetchFilteredProducts(FilterModel filter) async {
    final products = await repo.fetchFilteredProducts(filter);
    if (products != null) {
      print(products);
      emit(state.copyWith(products: products));
    }
  }

  Future<void> fetchFilters() async {
    final filters = await repo.fetchFilters();
    if (filters != null) {
      emit(state.copyWith(filters: filters));
    }
  }

  Future<void> fetchBrands() async {
    final brands = await repo.fetchBrands();
    if (brands != null) {
      emit(state.copyWith(brands: brands));
    }
  }

  Future<void> fetchFAQs() async {
    final faqs = await repo.getFaqs();
    if (faqs != null) {
      emit(state.copyWith(faqs: faqs));
    }
  }
}
