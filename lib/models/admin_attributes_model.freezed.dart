// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_attributes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminAttributesModel _$AdminAttributesModelFromJson(Map<String, dynamic> json) {
  return _AdminAttributesModel.fromJson(json);
}

/// @nodoc
mixin _$AdminAttributesModel {
  List<EquipmentType> get equipmentTypes => throw _privateConstructorUsedError;
  List<String> get muscleGroups => throw _privateConstructorUsedError;
  List<String> get movementPatterns => throw _privateConstructorUsedError;
  List<ExerciseModifier> get exerciseModifiers =>
      throw _privateConstructorUsedError;

  /// Serializes this AdminAttributesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminAttributesModelCopyWith<AdminAttributesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminAttributesModelCopyWith<$Res> {
  factory $AdminAttributesModelCopyWith(AdminAttributesModel value,
          $Res Function(AdminAttributesModel) then) =
      _$AdminAttributesModelCopyWithImpl<$Res, AdminAttributesModel>;
  @useResult
  $Res call(
      {List<EquipmentType> equipmentTypes,
      List<String> muscleGroups,
      List<String> movementPatterns,
      List<ExerciseModifier> exerciseModifiers});
}

/// @nodoc
class _$AdminAttributesModelCopyWithImpl<$Res,
        $Val extends AdminAttributesModel>
    implements $AdminAttributesModelCopyWith<$Res> {
  _$AdminAttributesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipmentTypes = null,
    Object? muscleGroups = null,
    Object? movementPatterns = null,
    Object? exerciseModifiers = null,
  }) {
    return _then(_value.copyWith(
      equipmentTypes: null == equipmentTypes
          ? _value.equipmentTypes
          : equipmentTypes // ignore: cast_nullable_to_non_nullable
              as List<EquipmentType>,
      muscleGroups: null == muscleGroups
          ? _value.muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      movementPatterns: null == movementPatterns
          ? _value.movementPatterns
          : movementPatterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exerciseModifiers: null == exerciseModifiers
          ? _value.exerciseModifiers
          : exerciseModifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminAttributesModelImplCopyWith<$Res>
    implements $AdminAttributesModelCopyWith<$Res> {
  factory _$$AdminAttributesModelImplCopyWith(_$AdminAttributesModelImpl value,
          $Res Function(_$AdminAttributesModelImpl) then) =
      __$$AdminAttributesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EquipmentType> equipmentTypes,
      List<String> muscleGroups,
      List<String> movementPatterns,
      List<ExerciseModifier> exerciseModifiers});
}

/// @nodoc
class __$$AdminAttributesModelImplCopyWithImpl<$Res>
    extends _$AdminAttributesModelCopyWithImpl<$Res, _$AdminAttributesModelImpl>
    implements _$$AdminAttributesModelImplCopyWith<$Res> {
  __$$AdminAttributesModelImplCopyWithImpl(_$AdminAttributesModelImpl _value,
      $Res Function(_$AdminAttributesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipmentTypes = null,
    Object? muscleGroups = null,
    Object? movementPatterns = null,
    Object? exerciseModifiers = null,
  }) {
    return _then(_$AdminAttributesModelImpl(
      equipmentTypes: null == equipmentTypes
          ? _value._equipmentTypes
          : equipmentTypes // ignore: cast_nullable_to_non_nullable
              as List<EquipmentType>,
      muscleGroups: null == muscleGroups
          ? _value._muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      movementPatterns: null == movementPatterns
          ? _value._movementPatterns
          : movementPatterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exerciseModifiers: null == exerciseModifiers
          ? _value._exerciseModifiers
          : exerciseModifiers // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModifier>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminAttributesModelImpl implements _AdminAttributesModel {
  const _$AdminAttributesModelImpl(
      {required final List<EquipmentType> equipmentTypes,
      required final List<String> muscleGroups,
      required final List<String> movementPatterns,
      required final List<ExerciseModifier> exerciseModifiers})
      : _equipmentTypes = equipmentTypes,
        _muscleGroups = muscleGroups,
        _movementPatterns = movementPatterns,
        _exerciseModifiers = exerciseModifiers;

  factory _$AdminAttributesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminAttributesModelImplFromJson(json);

  final List<EquipmentType> _equipmentTypes;
  @override
  List<EquipmentType> get equipmentTypes {
    if (_equipmentTypes is EqualUnmodifiableListView) return _equipmentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipmentTypes);
  }

  final List<String> _muscleGroups;
  @override
  List<String> get muscleGroups {
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleGroups);
  }

  final List<String> _movementPatterns;
  @override
  List<String> get movementPatterns {
    if (_movementPatterns is EqualUnmodifiableListView)
      return _movementPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movementPatterns);
  }

  final List<ExerciseModifier> _exerciseModifiers;
  @override
  List<ExerciseModifier> get exerciseModifiers {
    if (_exerciseModifiers is EqualUnmodifiableListView)
      return _exerciseModifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseModifiers);
  }

  @override
  String toString() {
    return 'AdminAttributesModel(equipmentTypes: $equipmentTypes, muscleGroups: $muscleGroups, movementPatterns: $movementPatterns, exerciseModifiers: $exerciseModifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminAttributesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._equipmentTypes, _equipmentTypes) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroups, _muscleGroups) &&
            const DeepCollectionEquality()
                .equals(other._movementPatterns, _movementPatterns) &&
            const DeepCollectionEquality()
                .equals(other._exerciseModifiers, _exerciseModifiers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_equipmentTypes),
      const DeepCollectionEquality().hash(_muscleGroups),
      const DeepCollectionEquality().hash(_movementPatterns),
      const DeepCollectionEquality().hash(_exerciseModifiers));

  /// Create a copy of AdminAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminAttributesModelImplCopyWith<_$AdminAttributesModelImpl>
      get copyWith =>
          __$$AdminAttributesModelImplCopyWithImpl<_$AdminAttributesModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminAttributesModelImplToJson(
      this,
    );
  }
}

abstract class _AdminAttributesModel implements AdminAttributesModel {
  const factory _AdminAttributesModel(
          {required final List<EquipmentType> equipmentTypes,
          required final List<String> muscleGroups,
          required final List<String> movementPatterns,
          required final List<ExerciseModifier> exerciseModifiers}) =
      _$AdminAttributesModelImpl;

  factory _AdminAttributesModel.fromJson(Map<String, dynamic> json) =
      _$AdminAttributesModelImpl.fromJson;

  @override
  List<EquipmentType> get equipmentTypes;
  @override
  List<String> get muscleGroups;
  @override
  List<String> get movementPatterns;
  @override
  List<ExerciseModifier> get exerciseModifiers;

  /// Create a copy of AdminAttributesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminAttributesModelImplCopyWith<_$AdminAttributesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EquipmentType _$EquipmentTypeFromJson(Map<String, dynamic> json) {
  return _EquipmentType.fromJson(json);
}

/// @nodoc
mixin _$EquipmentType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this EquipmentType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EquipmentType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EquipmentTypeCopyWith<EquipmentType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentTypeCopyWith<$Res> {
  factory $EquipmentTypeCopyWith(
          EquipmentType value, $Res Function(EquipmentType) then) =
      _$EquipmentTypeCopyWithImpl<$Res, EquipmentType>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$EquipmentTypeCopyWithImpl<$Res, $Val extends EquipmentType>
    implements $EquipmentTypeCopyWith<$Res> {
  _$EquipmentTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EquipmentType
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
abstract class _$$EquipmentTypeImplCopyWith<$Res>
    implements $EquipmentTypeCopyWith<$Res> {
  factory _$$EquipmentTypeImplCopyWith(
          _$EquipmentTypeImpl value, $Res Function(_$EquipmentTypeImpl) then) =
      __$$EquipmentTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$EquipmentTypeImplCopyWithImpl<$Res>
    extends _$EquipmentTypeCopyWithImpl<$Res, _$EquipmentTypeImpl>
    implements _$$EquipmentTypeImplCopyWith<$Res> {
  __$$EquipmentTypeImplCopyWithImpl(
      _$EquipmentTypeImpl _value, $Res Function(_$EquipmentTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of EquipmentType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$EquipmentTypeImpl(
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
class _$EquipmentTypeImpl implements _EquipmentType {
  const _$EquipmentTypeImpl({required this.id, required this.name});

  factory _$EquipmentTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'EquipmentType(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EquipmentType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentTypeImplCopyWith<_$EquipmentTypeImpl> get copyWith =>
      __$$EquipmentTypeImplCopyWithImpl<_$EquipmentTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentTypeImplToJson(
      this,
    );
  }
}

abstract class _EquipmentType implements EquipmentType {
  const factory _EquipmentType(
      {required final String id,
      required final String name}) = _$EquipmentTypeImpl;

  factory _EquipmentType.fromJson(Map<String, dynamic> json) =
      _$EquipmentTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of EquipmentType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EquipmentTypeImplCopyWith<_$EquipmentTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseModifier _$ExerciseModifierFromJson(Map<String, dynamic> json) {
  return _ExerciseModifier.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModifier {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ModifierParameter get parameter =>
      throw _privateConstructorUsedError; // Changed to single parameter
  ValueType get valueType => throw _privateConstructorUsedError;

  /// Serializes this ExerciseModifier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseModifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseModifierCopyWith<ExerciseModifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModifierCopyWith<$Res> {
  factory $ExerciseModifierCopyWith(
          ExerciseModifier value, $Res Function(ExerciseModifier) then) =
      _$ExerciseModifierCopyWithImpl<$Res, ExerciseModifier>;
  @useResult
  $Res call(
      {String id,
      String name,
      ModifierParameter parameter,
      ValueType valueType});
}

/// @nodoc
class _$ExerciseModifierCopyWithImpl<$Res, $Val extends ExerciseModifier>
    implements $ExerciseModifierCopyWith<$Res> {
  _$ExerciseModifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseModifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parameter = null,
    Object? valueType = null,
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
      parameter: null == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as ModifierParameter,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseModifierImplCopyWith<$Res>
    implements $ExerciseModifierCopyWith<$Res> {
  factory _$$ExerciseModifierImplCopyWith(_$ExerciseModifierImpl value,
          $Res Function(_$ExerciseModifierImpl) then) =
      __$$ExerciseModifierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ModifierParameter parameter,
      ValueType valueType});
}

/// @nodoc
class __$$ExerciseModifierImplCopyWithImpl<$Res>
    extends _$ExerciseModifierCopyWithImpl<$Res, _$ExerciseModifierImpl>
    implements _$$ExerciseModifierImplCopyWith<$Res> {
  __$$ExerciseModifierImplCopyWithImpl(_$ExerciseModifierImpl _value,
      $Res Function(_$ExerciseModifierImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseModifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parameter = null,
    Object? valueType = null,
  }) {
    return _then(_$ExerciseModifierImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameter: null == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as ModifierParameter,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModifierImpl implements _ExerciseModifier {
  const _$ExerciseModifierImpl(
      {required this.id,
      required this.name,
      required this.parameter,
      required this.valueType});

  factory _$ExerciseModifierImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModifierImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ModifierParameter parameter;
// Changed to single parameter
  @override
  final ValueType valueType;

  @override
  String toString() {
    return 'ExerciseModifier(id: $id, name: $name, parameter: $parameter, valueType: $valueType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModifierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parameter, parameter) ||
                other.parameter == parameter) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, parameter, valueType);

  /// Create a copy of ExerciseModifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseModifierImplCopyWith<_$ExerciseModifierImpl> get copyWith =>
      __$$ExerciseModifierImplCopyWithImpl<_$ExerciseModifierImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseModifierImplToJson(
      this,
    );
  }
}

abstract class _ExerciseModifier implements ExerciseModifier {
  const factory _ExerciseModifier(
      {required final String id,
      required final String name,
      required final ModifierParameter parameter,
      required final ValueType valueType}) = _$ExerciseModifierImpl;

  factory _ExerciseModifier.fromJson(Map<String, dynamic> json) =
      _$ExerciseModifierImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ModifierParameter get parameter; // Changed to single parameter
  @override
  ValueType get valueType;

  /// Create a copy of ExerciseModifier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseModifierImplCopyWith<_$ExerciseModifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
