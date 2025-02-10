import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_cubit.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default([]) List<String> selectedSubcategories,
    @Default(RangeValues(5000, 100000)) RangeValues priceRange,
    String? selectedCategory,
  }) = _FilterState;
}

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void toggleSubcategory(String subcategory) {
    final updatedSubcategories = state.selectedSubcategories
            .contains(subcategory)
        ? state.selectedSubcategories.where((e) => e != subcategory).toList()
        : [...state.selectedSubcategories, subcategory];
    emit(state.copyWith(selectedSubcategories: updatedSubcategories));
  }

  void updatePriceRange(RangeValues newRange) {
    emit(state.copyWith(priceRange: newRange));
  }

  void clearFilters() {
    emit(const FilterState());
  }
}
