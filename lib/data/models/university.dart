import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'university.freezed.dart';
part 'university.g.dart';

@freezed
class University with _$University {
  const factory University({
    required String name,
    String? country,
    @JsonKey(name: "state-province")
    String? stateProvince,
    @JsonKey(name: "alpha_two_code")
    String? alphaTwoCode,
    @JsonKey(name: "web_pages")
    List<String>? webPages,
    List<String>? domains,
  }) = _University;

  factory University.fromJson(Map<String, Object?> json)
      => _$UniversityFromJson(json);
}