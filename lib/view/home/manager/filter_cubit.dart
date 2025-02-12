import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_cubit.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default({}) Map<String, dynamic> selectedSubcategories,
    @Default(RangeValues(5000, 100000)) RangeValues priceRange,
    @Default('Brand') String? selectedCategory,
  }) = _FilterState;
}

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void toggleSubcategory(String category, String subcategory) {
    final updatedSubcategories =
        Map<String, List<String>>.from(state.selectedSubcategories);

    if (updatedSubcategories.containsKey(category)) {
      final updatedList = List<String>.from(updatedSubcategories[category]!);
      if (updatedList.contains(subcategory)) {
        updatedList.remove(subcategory);
        if (updatedList.isEmpty) {
          updatedSubcategories.remove(category);
        } else {
          updatedSubcategories[category] = updatedList;
        }
      } else {
        updatedList.add(subcategory);
        updatedSubcategories[category] = updatedList;
      }
    } else {
      updatedSubcategories[category] = [subcategory];
    }

    emit(state.copyWith(selectedSubcategories: updatedSubcategories));
  }

  void updatePriceRange(RangeValues newRange) {
    emit(state.copyWith(priceRange: newRange));
  }

  void clearFilters() {
    emit(const FilterState());
  }
}
