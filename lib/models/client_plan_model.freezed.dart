// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientPlanModel _$ClientPlanModelFromJson(Map<String, dynamic> json) {
  return _ClientPlanModel.fromJson(json);
}

/// @nodoc
mixin _$ClientPlanModel {
  String get id => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get templateId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Serializes this ClientPlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientPlanModelCopyWith<ClientPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientPlanModelCopyWith<$Res> {
  factory $ClientPlanModelCopyWith(
          ClientPlanModel value, $Res Function(ClientPlanModel) then) =
      _$ClientPlanModelCopyWithImpl<$Res, ClientPlanModel>;
  @useResult
  $Res call(
      {String id,
      String clientId,
      String templateId,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class _$ClientPlanModelCopyWithImpl<$Res, $Val extends ClientPlanModel>
    implements $ClientPlanModelCopyWith<$Res> {
  _$ClientPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? templateId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientPlanModelImplCopyWith<$Res>
    implements $ClientPlanModelCopyWith<$Res> {
  factory _$$ClientPlanModelImplCopyWith(_$ClientPlanModelImpl value,
          $Res Function(_$ClientPlanModelImpl) then) =
      __$$ClientPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clientId,
      String templateId,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class __$$ClientPlanModelImplCopyWithImpl<$Res>
    extends _$ClientPlanModelCopyWithImpl<$Res, _$ClientPlanModelImpl>
    implements _$$ClientPlanModelImplCopyWith<$Res> {
  __$$ClientPlanModelImplCopyWithImpl(
      _$ClientPlanModelImpl _value, $Res Function(_$ClientPlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? templateId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$ClientPlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientPlanModelImpl implements _ClientPlanModel {
  const _$ClientPlanModelImpl(
      {required this.id,
      required this.clientId,
      required this.templateId,
      required this.startDate,
      required this.endDate});

  factory _$ClientPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientPlanModelImplFromJson(json);

  @override
  final String id;
  @override
  final String clientId;
  @override
  final String templateId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'ClientPlanModel(id: $id, clientId: $clientId, templateId: $templateId, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, clientId, templateId, startDate, endDate);

  /// Create a copy of ClientPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientPlanModelImplCopyWith<_$ClientPlanModelImpl> get copyWith =>
      __$$ClientPlanModelImplCopyWithImpl<_$ClientPlanModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientPlanModelImplToJson(
      this,
    );
  }
}

abstract class _ClientPlanModel implements ClientPlanModel {
  const factory _ClientPlanModel(
      {required final String id,
      required final String clientId,
      required final String templateId,
      required final DateTime startDate,
      required final DateTime endDate}) = _$ClientPlanModelImpl;

  factory _ClientPlanModel.fromJson(Map<String, dynamic> json) =
      _$ClientPlanModelImpl.fromJson;

  @override
  String get id;
  @override
  String get clientId;
  @override
  String get templateId;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of ClientPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientPlanModelImplCopyWith<_$ClientPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
