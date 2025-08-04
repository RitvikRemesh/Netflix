import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix1/domain/core/api_end_points.dart';
import 'package:netflix1/domain/core/failures/main_failure.dart';
import 'package:netflix1/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix1/domain/hot_and_new_resp/hot_and_new_service.dart';


@LazySingleton(as:HotAndNewService )
class HotAndNewImplementation implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData()async {
     try {
      final response = await Dio(
        BaseOptions(),
      ).get(ApiEndPoints.hotAndNewMovie,);
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTVData() async {
     try {
      final response = await Dio(
        BaseOptions(),
      ).get(ApiEndPoints.hotAndNewTV,);
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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