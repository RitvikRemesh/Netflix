import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix1/domain/core/api_end_points.dart';
import 'package:netflix1/domain/core/failures/main_failure.dart';
import 'package:netflix1/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix1/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImplimentation implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      final response = await Dio(
        BaseOptions(),
      ).get(ApiEndPoints.search, queryParameters: {'query': movieQuery});
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
