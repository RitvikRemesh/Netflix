// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResp _$SearchRespFromJson(Map<String, dynamic> json) => SearchResp(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SerchResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchRespToJson(SearchResp instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SerchResultData _$SerchResultDataFromJson(Map<String, dynamic> json) =>
    SerchResultData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterpath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SerchResultDataToJson(SerchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterpath,
    };
