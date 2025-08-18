import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement_pattern_model.freezed.dart';
part 'movement_pattern_model.g.dart';

@freezed
class MovementPattern with _$MovementPattern {
  const factory MovementPattern({
    required String id,
    required String name,
  }) = _MovementPattern;

  factory MovementPattern.fromJson(Map<String, dynamic> json) => _$MovementPatternFromJson(json);
}