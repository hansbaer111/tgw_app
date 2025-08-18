// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_pattern_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovementPattern _$MovementPatternFromJson(Map<String, dynamic> json) {
  return _MovementPattern.fromJson(json);
}

/// @nodoc
mixin _$MovementPattern {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MovementPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementPatternCopyWith<MovementPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementPatternCopyWith<$Res> {
  factory $MovementPatternCopyWith(
          MovementPattern value, $Res Function(MovementPattern) then) =
      _$MovementPatternCopyWithImpl<$Res, MovementPattern>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$MovementPatternCopyWithImpl<$Res, $Val extends MovementPattern>
    implements $MovementPatternCopyWith<$Res> {
  _$MovementPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovementPatternImplCopyWith<$Res>
    implements $MovementPatternCopyWith<$Res> {
  factory _$$MovementPatternImplCopyWith(_$MovementPatternImpl value,
          $Res Function(_$MovementPatternImpl) then) =
      __$$MovementPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$MovementPatternImplCopyWithImpl<$Res>
    extends _$MovementPatternCopyWithImpl<$Res, _$MovementPatternImpl>
    implements _$$MovementPatternImplCopyWith<$Res> {
  __$$MovementPatternImplCopyWithImpl(
      _$MovementPatternImpl _value, $Res Function(_$MovementPatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovementPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MovementPatternImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementPatternImpl implements _MovementPattern {
  const _$MovementPatternImpl({required this.id, required this.name});

  factory _$MovementPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementPatternImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'MovementPattern(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementPatternImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of MovementPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementPatternImplCopyWith<_$MovementPatternImpl> get copyWith =>
      __$$MovementPatternImplCopyWithImpl<_$MovementPatternImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementPatternImplToJson(
      this,
    );
  }
}

abstract class _MovementPattern implements MovementPattern {
  const factory _MovementPattern(
      {required final String id,
      required final String name}) = _$MovementPatternImpl;

  factory _MovementPattern.fromJson(Map<String, dynamic> json) =
      _$MovementPatternImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of MovementPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementPatternImplCopyWith<_$MovementPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
