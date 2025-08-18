// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayModel _$DayModelFromJson(Map<String, dynamic> json) {
  return _DayModel.fromJson(json);
}

/// @nodoc
mixin _$DayModel {
  String get name => throw _privateConstructorUsedError;
  List<ExerciseInPlanModel> get exercises => throw _privateConstructorUsedError;

  /// Serializes this DayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayModelCopyWith<DayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayModelCopyWith<$Res> {
  factory $DayModelCopyWith(DayModel value, $Res Function(DayModel) then) =
      _$DayModelCopyWithImpl<$Res, DayModel>;
  @useResult
  $Res call({String name, List<ExerciseInPlanModel> exercises});
}

/// @nodoc
class _$DayModelCopyWithImpl<$Res, $Val extends DayModel>
    implements $DayModelCopyWith<$Res> {
  _$DayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseInPlanModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayModelImplCopyWith<$Res>
    implements $DayModelCopyWith<$Res> {
  factory _$$DayModelImplCopyWith(
          _$DayModelImpl value, $Res Function(_$DayModelImpl) then) =
      __$$DayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ExerciseInPlanModel> exercises});
}

/// @nodoc
class __$$DayModelImplCopyWithImpl<$Res>
    extends _$DayModelCopyWithImpl<$Res, _$DayModelImpl>
    implements _$$DayModelImplCopyWith<$Res> {
  __$$DayModelImplCopyWithImpl(
      _$DayModelImpl _value, $Res Function(_$DayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? exercises = null,
  }) {
    return _then(_$DayModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseInPlanModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayModelImpl implements _DayModel {
  const _$DayModelImpl(
      {required this.name, required final List<ExerciseInPlanModel> exercises})
      : _exercises = exercises;

  factory _$DayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayModelImplFromJson(json);

  @override
  final String name;
  final List<ExerciseInPlanModel> _exercises;
  @override
  List<ExerciseInPlanModel> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'DayModel(name: $name, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_exercises));

  /// Create a copy of DayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      __$$DayModelImplCopyWithImpl<_$DayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayModelImplToJson(
      this,
    );
  }
}

abstract class _DayModel implements DayModel {
  const factory _DayModel(
      {required final String name,
      required final List<ExerciseInPlanModel> exercises}) = _$DayModelImpl;

  factory _DayModel.fromJson(Map<String, dynamic> json) =
      _$DayModelImpl.fromJson;

  @override
  String get name;
  @override
  List<ExerciseInPlanModel> get exercises;

  /// Create a copy of DayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
