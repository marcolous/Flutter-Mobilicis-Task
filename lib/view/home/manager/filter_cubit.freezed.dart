// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterState {
  Map<String, dynamic> get selectedSubcategories =>
      throw _privateConstructorUsedError;
  RangeValues get priceRange => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call(
      {Map<String, dynamic> selectedSubcategories,
      RangeValues priceRange,
      String? selectedCategory});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubcategories = null,
    Object? priceRange = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSubcategories: null == selectedSubcategories
          ? _value.selectedSubcategories
          : selectedSubcategories // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> selectedSubcategories,
      RangeValues priceRange,
      String? selectedCategory});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubcategories = null,
    Object? priceRange = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_$FilterStateImpl(
      selectedSubcategories: null == selectedSubcategories
          ? _value._selectedSubcategories
          : selectedSubcategories // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as RangeValues,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl(
      {final Map<String, dynamic> selectedSubcategories = const {},
      this.priceRange = const RangeValues(5000, 100000),
      this.selectedCategory = 'Brand'})
      : _selectedSubcategories = selectedSubcategories;

  final Map<String, dynamic> _selectedSubcategories;
  @override
  @JsonKey()
  Map<String, dynamic> get selectedSubcategories {
    if (_selectedSubcategories is EqualUnmodifiableMapView)
      return _selectedSubcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedSubcategories);
  }

  @override
  @JsonKey()
  final RangeValues priceRange;
  @override
  @JsonKey()
  final String? selectedCategory;

  @override
  String toString() {
    return 'FilterState(selectedSubcategories: $selectedSubcategories, priceRange: $priceRange, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedSubcategories, _selectedSubcategories) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedSubcategories),
      priceRange,
      selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {final Map<String, dynamic> selectedSubcategories,
      final RangeValues priceRange,
      final String? selectedCategory}) = _$FilterStateImpl;

  @override
  Map<String, dynamic> get selectedSubcategories;
  @override
  RangeValues get priceRange;
  @override
  String? get selectedCategory;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
