// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutLogModel _$WorkoutLogModelFromJson(Map<String, dynamic> json) {
  return _WorkoutLogModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutLogModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get dayId => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<WorkoutSetModel> get sets => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<EditHistoryEntry>? get editHistory => throw _privateConstructorUsedError;

  /// Serializes this WorkoutLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutLogModelCopyWith<WorkoutLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutLogModelCopyWith<$Res> {
  factory $WorkoutLogModelCopyWith(
          WorkoutLogModel value, $Res Function(WorkoutLogModel) then) =
      _$WorkoutLogModelCopyWithImpl<$Res, WorkoutLogModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String dayId,
      String exerciseId,
      DateTime date,
      List<WorkoutSetModel> sets,
      String? notes,
      List<EditHistoryEntry>? editHistory});
}

/// @nodoc
class _$WorkoutLogModelCopyWithImpl<$Res, $Val extends WorkoutLogModel>
    implements $WorkoutLogModelCopyWith<$Res> {
  _$WorkoutLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? dayId = null,
    Object? exerciseId = null,
    Object? date = null,
    Object? sets = null,
    Object? notes = freezed,
    Object? editHistory = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      editHistory: freezed == editHistory
          ? _value.editHistory
          : editHistory // ignore: cast_nullable_to_non_nullable
              as List<EditHistoryEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutLogModelImplCopyWith<$Res>
    implements $WorkoutLogModelCopyWith<$Res> {
  factory _$$WorkoutLogModelImplCopyWith(_$WorkoutLogModelImpl value,
          $Res Function(_$WorkoutLogModelImpl) then) =
      __$$WorkoutLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String dayId,
      String exerciseId,
      DateTime date,
      List<WorkoutSetModel> sets,
      String? notes,
      List<EditHistoryEntry>? editHistory});
}

/// @nodoc
class __$$WorkoutLogModelImplCopyWithImpl<$Res>
    extends _$WorkoutLogModelCopyWithImpl<$Res, _$WorkoutLogModelImpl>
    implements _$$WorkoutLogModelImplCopyWith<$Res> {
  __$$WorkoutLogModelImplCopyWithImpl(
      _$WorkoutLogModelImpl _value, $Res Function(_$WorkoutLogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? dayId = null,
    Object? exerciseId = null,
    Object? date = null,
    Object? sets = null,
    Object? notes = freezed,
    Object? editHistory = freezed,
  }) {
    return _then(_$WorkoutLogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dayId: null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      editHistory: freezed == editHistory
          ? _value._editHistory
          : editHistory // ignore: cast_nullable_to_non_nullable
              as List<EditHistoryEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutLogModelImpl implements _WorkoutLogModel {
  const _$WorkoutLogModelImpl(
      {required this.id,
      required this.userId,
      required this.dayId,
      required this.exerciseId,
      required this.date,
      required final List<WorkoutSetModel> sets,
      this.notes,
      final List<EditHistoryEntry>? editHistory})
      : _sets = sets,
        _editHistory = editHistory;

  factory _$WorkoutLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutLogModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String dayId;
  @override
  final String exerciseId;
  @override
  final DateTime date;
  final List<WorkoutSetModel> _sets;
  @override
  List<WorkoutSetModel> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final String? notes;
  final List<EditHistoryEntry>? _editHistory;
  @override
  List<EditHistoryEntry>? get editHistory {
    final value = _editHistory;
    if (value == null) return null;
    if (_editHistory is EqualUnmodifiableListView) return _editHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkoutLogModel(id: $id, userId: $userId, dayId: $dayId, exerciseId: $exerciseId, date: $date, sets: $sets, notes: $notes, editHistory: $editHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutLogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._editHistory, _editHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      dayId,
      exerciseId,
      date,
      const DeepCollectionEquality().hash(_sets),
      notes,
      const DeepCollectionEquality().hash(_editHistory));

  /// Create a copy of WorkoutLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutLogModelImplCopyWith<_$WorkoutLogModelImpl> get copyWith =>
      __$$WorkoutLogModelImplCopyWithImpl<_$WorkoutLogModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutLogModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutLogModel implements WorkoutLogModel {
  const factory _WorkoutLogModel(
      {required final String id,
      required final String userId,
      required final String dayId,
      required final String exerciseId,
      required final DateTime date,
      required final List<WorkoutSetModel> sets,
      final String? notes,
      final List<EditHistoryEntry>? editHistory}) = _$WorkoutLogModelImpl;

  factory _WorkoutLogModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutLogModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get dayId;
  @override
  String get exerciseId;
  @override
  DateTime get date;
  @override
  List<WorkoutSetModel> get sets;
  @override
  String? get notes;
  @override
  List<EditHistoryEntry>? get editHistory;

  /// Create a copy of WorkoutLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutLogModelImplCopyWith<_$WorkoutLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditHistoryEntry _$EditHistoryEntryFromJson(Map<String, dynamic> json) {
  return _EditHistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$EditHistoryEntry {
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get editorId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this EditHistoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditHistoryEntryCopyWith<EditHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditHistoryEntryCopyWith<$Res> {
  factory $EditHistoryEntryCopyWith(
          EditHistoryEntry value, $Res Function(EditHistoryEntry) then) =
      _$EditHistoryEntryCopyWithImpl<$Res, EditHistoryEntry>;
  @useResult
  $Res call({DateTime timestamp, String editorId, String reason});
}

/// @nodoc
class _$EditHistoryEntryCopyWithImpl<$Res, $Val extends EditHistoryEntry>
    implements $EditHistoryEntryCopyWith<$Res> {
  _$EditHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? editorId = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      editorId: null == editorId
          ? _value.editorId
          : editorId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditHistoryEntryImplCopyWith<$Res>
    implements $EditHistoryEntryCopyWith<$Res> {
  factory _$$EditHistoryEntryImplCopyWith(_$EditHistoryEntryImpl value,
          $Res Function(_$EditHistoryEntryImpl) then) =
      __$$EditHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, String editorId, String reason});
}

/// @nodoc
class __$$EditHistoryEntryImplCopyWithImpl<$Res>
    extends _$EditHistoryEntryCopyWithImpl<$Res, _$EditHistoryEntryImpl>
    implements _$$EditHistoryEntryImplCopyWith<$Res> {
  __$$EditHistoryEntryImplCopyWithImpl(_$EditHistoryEntryImpl _value,
      $Res Function(_$EditHistoryEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? editorId = null,
    Object? reason = null,
  }) {
    return _then(_$EditHistoryEntryImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      editorId: null == editorId
          ? _value.editorId
          : editorId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditHistoryEntryImpl implements _EditHistoryEntry {
  const _$EditHistoryEntryImpl(
      {required this.timestamp, required this.editorId, required this.reason});

  factory _$EditHistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditHistoryEntryImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String editorId;
  @override
  final String reason;

  @override
  String toString() {
    return 'EditHistoryEntry(timestamp: $timestamp, editorId: $editorId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditHistoryEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.editorId, editorId) ||
                other.editorId == editorId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, editorId, reason);

  /// Create a copy of EditHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditHistoryEntryImplCopyWith<_$EditHistoryEntryImpl> get copyWith =>
      __$$EditHistoryEntryImplCopyWithImpl<_$EditHistoryEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditHistoryEntryImplToJson(
      this,
    );
  }
}

abstract class _EditHistoryEntry implements EditHistoryEntry {
  const factory _EditHistoryEntry(
      {required final DateTime timestamp,
      required final String editorId,
      required final String reason}) = _$EditHistoryEntryImpl;

  factory _EditHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$EditHistoryEntryImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  String get editorId;
  @override
  String get reason;

  /// Create a copy of EditHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditHistoryEntryImplCopyWith<_$EditHistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
