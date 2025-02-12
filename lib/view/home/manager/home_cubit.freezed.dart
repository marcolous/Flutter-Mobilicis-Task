// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  FilterModel get filters => throw _privateConstructorUsedError;
  List<BrandModel>? get brands => throw _privateConstructorUsedError;
  FaqModelResponse get faqs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {FilterModel filters, List<BrandModel>? brands, FaqModelResponse faqs});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? brands = freezed,
    Object? faqs = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FilterModel,
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>?,
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as FaqModelResponse,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FilterModel filters, List<BrandModel>? brands, FaqModelResponse faqs});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? brands = freezed,
    Object? faqs = null,
  }) {
    return _then(_$HomeStateImpl(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FilterModel,
      brands: freezed == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>?,
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as FaqModelResponse,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.filters = const FilterModel(),
      final List<BrandModel>? brands = const [],
      this.faqs = const FaqModelResponse()})
      : _brands = brands;

  @override
  @JsonKey()
  final FilterModel filters;
  final List<BrandModel>? _brands;
  @override
  @JsonKey()
  List<BrandModel>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FaqModelResponse faqs;

  @override
  String toString() {
    return 'HomeState(filters: $filters, brands: $brands, faqs: $faqs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.filters, filters) || other.filters == filters) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.faqs, faqs) || other.faqs == faqs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, filters, const DeepCollectionEquality().hash(_brands), faqs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final FilterModel filters,
      final List<BrandModel>? brands,
      final FaqModelResponse faqs}) = _$HomeStateImpl;

  @override
  FilterModel get filters;
  @override
  List<BrandModel>? get brands;
  @override
  FaqModelResponse get faqs;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
