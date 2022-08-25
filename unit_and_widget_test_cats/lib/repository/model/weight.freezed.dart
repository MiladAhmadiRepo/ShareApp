// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weight _$WeightFromJson(Map<String, dynamic> json) {
  return _Weight.fromJson(json);
}

/// @nodoc
mixin _$Weight {
  String? get imperial => throw _privateConstructorUsedError;
  String? get metric => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeightCopyWith<Weight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightCopyWith<$Res> {
  factory $WeightCopyWith(Weight value, $Res Function(Weight) then) =
      _$WeightCopyWithImpl<$Res>;
  $Res call({String? imperial, String? metric});
}

/// @nodoc
class _$WeightCopyWithImpl<$Res> implements $WeightCopyWith<$Res> {
  _$WeightCopyWithImpl(this._value, this._then);

  final Weight _value;
  // ignore: unused_field
  final $Res Function(Weight) _then;

  @override
  $Res call({
    Object? imperial = freezed,
    Object? metric = freezed,
  }) {
    return _then(_value.copyWith(
      imperial: imperial == freezed
          ? _value.imperial
          : imperial // ignore: cast_nullable_to_non_nullable
              as String?,
      metric: metric == freezed
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WeightCopyWith<$Res> implements $WeightCopyWith<$Res> {
  factory _$$_WeightCopyWith(_$_Weight value, $Res Function(_$_Weight) then) =
      __$$_WeightCopyWithImpl<$Res>;
  @override
  $Res call({String? imperial, String? metric});
}

/// @nodoc
class __$$_WeightCopyWithImpl<$Res> extends _$WeightCopyWithImpl<$Res>
    implements _$$_WeightCopyWith<$Res> {
  __$$_WeightCopyWithImpl(_$_Weight _value, $Res Function(_$_Weight) _then)
      : super(_value, (v) => _then(v as _$_Weight));

  @override
  _$_Weight get _value => super._value as _$_Weight;

  @override
  $Res call({
    Object? imperial = freezed,
    Object? metric = freezed,
  }) {
    return _then(_$_Weight(
      imperial: imperial == freezed
          ? _value.imperial
          : imperial // ignore: cast_nullable_to_non_nullable
              as String?,
      metric: metric == freezed
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weight implements _Weight {
  const _$_Weight({this.imperial, this.metric});

  factory _$_Weight.fromJson(Map<String, dynamic> json) =>
      _$$_WeightFromJson(json);

  @override
  final String? imperial;
  @override
  final String? metric;

  @override
  String toString() {
    return 'Weight(imperial: $imperial, metric: $metric)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weight &&
            const DeepCollectionEquality().equals(other.imperial, imperial) &&
            const DeepCollectionEquality().equals(other.metric, metric));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imperial),
      const DeepCollectionEquality().hash(metric));

  @JsonKey(ignore: true)
  @override
  _$$_WeightCopyWith<_$_Weight> get copyWith =>
      __$$_WeightCopyWithImpl<_$_Weight>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeightToJson(
      this,
    );
  }
}

abstract class _Weight implements Weight {
  const factory _Weight({final String? imperial, final String? metric}) =
      _$_Weight;

  factory _Weight.fromJson(Map<String, dynamic> json) = _$_Weight.fromJson;

  @override
  String? get imperial;
  @override
  String? get metric;
  @override
  @JsonKey(ignore: true)
  _$$_WeightCopyWith<_$_Weight> get copyWith =>
      throw _privateConstructorUsedError;
}
