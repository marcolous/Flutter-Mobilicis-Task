import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilicis_task/models/brand_model.dart';
import 'package:mobilicis_task/models/faq_model.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/services/repo/home_repo.dart';

part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(FilterModel()) FilterModel filters,
    @Default([]) List<BrandModel>? brands,
    @Default(FaqModelResponse()) FaqModelResponse faqs,
  }) = _HomeState;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    fetchData();
  }
  HomeRepo repo = HomeRepo();

  Future<void> fetchData() async {
    await fetchFilters();
    await fetchBrands();
    await fetchFAQs();
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
