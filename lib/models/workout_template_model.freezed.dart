// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutTemplateModel _$WorkoutTemplateModelFromJson(Map<String, dynamic> json) {
  return _WorkoutTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutTemplateModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<DayModel> get days => throw _privateConstructorUsedError;

  /// Serializes this WorkoutTemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutTemplateModelCopyWith<WorkoutTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutTemplateModelCopyWith<$Res> {
  factory $WorkoutTemplateModelCopyWith(WorkoutTemplateModel value,
          $Res Function(WorkoutTemplateModel) then) =
      _$WorkoutTemplateModelCopyWithImpl<$Res, WorkoutTemplateModel>;
  @useResult
  $Res call({String id, String name, String description, List<DayModel> days});
}

/// @nodoc
class _$WorkoutTemplateModelCopyWithImpl<$Res,
        $Val extends WorkoutTemplateModel>
    implements $WorkoutTemplateModelCopyWith<$Res> {
  _$WorkoutTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? days = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutTemplateModelImplCopyWith<$Res>
    implements $WorkoutTemplateModelCopyWith<$Res> {
  factory _$$WorkoutTemplateModelImplCopyWith(_$WorkoutTemplateModelImpl value,
          $Res Function(_$WorkoutTemplateModelImpl) then) =
      __$$WorkoutTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, List<DayModel> days});
}

/// @nodoc
class __$$WorkoutTemplateModelImplCopyWithImpl<$Res>
    extends _$WorkoutTemplateModelCopyWithImpl<$Res, _$WorkoutTemplateModelImpl>
    implements _$$WorkoutTemplateModelImplCopyWith<$Res> {
  __$$WorkoutTemplateModelImplCopyWithImpl(_$WorkoutTemplateModelImpl _value,
      $Res Function(_$WorkoutTemplateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? days = null,
  }) {
    return _then(_$WorkoutTemplateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutTemplateModelImpl implements _WorkoutTemplateModel {
  const _$WorkoutTemplateModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required final List<DayModel> days})
      : _days = days;

  factory _$WorkoutTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutTemplateModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  final List<DayModel> _days;
  @override
  List<DayModel> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'WorkoutTemplateModel(id: $id, name: $name, description: $description, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTemplateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_days));

  /// Create a copy of WorkoutTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutTemplateModelImplCopyWith<_$WorkoutTemplateModelImpl>
      get copyWith =>
          __$$WorkoutTemplateModelImplCopyWithImpl<_$WorkoutTemplateModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutTemplateModel implements WorkoutTemplateModel {
  const factory _WorkoutTemplateModel(
      {required final String id,
      required final String name,
      required final String description,
      required final List<DayModel> days}) = _$WorkoutTemplateModelImpl;

  factory _WorkoutTemplateModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutTemplateModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<DayModel> get days;

  /// Create a copy of WorkoutTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutTemplateModelImplCopyWith<_$WorkoutTemplateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
