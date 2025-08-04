import 'package:json_annotation/json_annotation.dart';
import 'package:netflix1/core/constants.dart';

part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'results')
  List<SerchResultData> results;

  SearchResp({this.results = const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SerchResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterpath;

  String get posterImageUrl => '$imageAppendUrl$posterpath';

  SerchResultData({this.id, this.originalTitle, this.posterpath});

  factory SerchResultData.fromJson(Map<String, dynamic> json) {
    return _$SerchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SerchResultDataToJson(this);
}
