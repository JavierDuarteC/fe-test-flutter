// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_University _$$_UniversityFromJson(Map<String, dynamic> json) =>
    _$_University(
      name: json['name'] as String,
      country: json['country'] as String?,
      stateProvince: json['state-province'] as String?,
      alphaTwoCode: json['alpha_two_code'] as String?,
      webPages: (json['web_pages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      domains:
          (json['domains'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UniversityToJson(_$_University instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'state-province': instance.stateProvince,
      'alpha_two_code': instance.alphaTwoCode,
      'web_pages': instance.webPages,
      'domains': instance.domains,
    };
