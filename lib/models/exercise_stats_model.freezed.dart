// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseStats _$ExerciseStatsFromJson(Map<String, dynamic> json) {
  return _ExerciseStats.fromJson(json);
}

/// @nodoc
mixin _$ExerciseStats {
  String get exerciseId => throw _privateConstructorUsedError;
  double get maxWeight => throw _privateConstructorUsedError;
  double get totalVolume => throw _privateConstructorUsedError;
  int get totalReps => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;

  /// Serializes this ExerciseStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseStatsCopyWith<ExerciseStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStatsCopyWith<$Res> {
  factory $ExerciseStatsCopyWith(
          ExerciseStats value, $Res Function(ExerciseStats) then) =
      _$ExerciseStatsCopyWithImpl<$Res, ExerciseStats>;
  @useResult
  $Res call(
      {String exerciseId,
      double maxWeight,
      double totalVolume,
      int totalReps,
      int totalSets});
}

/// @nodoc
class _$ExerciseStatsCopyWithImpl<$Res, $Val extends ExerciseStats>
    implements $ExerciseStatsCopyWith<$Res> {
  _$ExerciseStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? maxWeight = null,
    Object? totalVolume = null,
    Object? totalReps = null,
    Object? totalSets = null,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      maxWeight: null == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseStatsImplCopyWith<$Res>
    implements $ExerciseStatsCopyWith<$Res> {
  factory _$$ExerciseStatsImplCopyWith(
          _$ExerciseStatsImpl value, $Res Function(_$ExerciseStatsImpl) then) =
      __$$ExerciseStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      double maxWeight,
      double totalVolume,
      int totalReps,
      int totalSets});
}

/// @nodoc
class __$$ExerciseStatsImplCopyWithImpl<$Res>
    extends _$ExerciseStatsCopyWithImpl<$Res, _$ExerciseStatsImpl>
    implements _$$ExerciseStatsImplCopyWith<$Res> {
  __$$ExerciseStatsImplCopyWithImpl(
      _$ExerciseStatsImpl _value, $Res Function(_$ExerciseStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? maxWeight = null,
    Object? totalVolume = null,
    Object? totalReps = null,
    Object? totalSets = null,
  }) {
    return _then(_$ExerciseStatsImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      maxWeight: null == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalVolume: null == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as double,
      totalReps: null == totalReps
          ? _value.totalReps
          : totalReps // ignore: cast_nullable_to_non_nullable
              as int,
      totalSets: null == totalSets
          ? _value.totalSets
          : totalSets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseStatsImpl implements _ExerciseStats {
  const _$ExerciseStatsImpl(
      {required this.exerciseId,
      required this.maxWeight,
      required this.totalVolume,
      required this.totalReps,
      required this.totalSets});

  factory _$ExerciseStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseStatsImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final double maxWeight;
  @override
  final double totalVolume;
  @override
  final int totalReps;
  @override
  final int totalSets;

  @override
  String toString() {
    return 'ExerciseStats(exerciseId: $exerciseId, maxWeight: $maxWeight, totalVolume: $totalVolume, totalReps: $totalReps, totalSets: $totalSets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseStatsImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.maxWeight, maxWeight) ||
                other.maxWeight == maxWeight) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.totalReps, totalReps) ||
                other.totalReps == totalReps) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, exerciseId, maxWeight, totalVolume, totalReps, totalSets);

  /// Create a copy of ExerciseStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseStatsImplCopyWith<_$ExerciseStatsImpl> get copyWith =>
      __$$ExerciseStatsImplCopyWithImpl<_$ExerciseStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseStatsImplToJson(
      this,
    );
  }
}

abstract class _ExerciseStats implements ExerciseStats {
  const factory _ExerciseStats(
      {required final String exerciseId,
      required final double maxWeight,
      required final double totalVolume,
      required final int totalReps,
      required final int totalSets}) = _$ExerciseStatsImpl;

  factory _ExerciseStats.fromJson(Map<String, dynamic> json) =
      _$ExerciseStatsImpl.fromJson;

  @override
  String get exerciseId;
  @override
  double get maxWeight;
  @override
  double get totalVolume;
  @override
  int get totalReps;
  @override
  int get totalSets;

  /// Create a copy of ExerciseStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseStatsImplCopyWith<_$ExerciseStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
