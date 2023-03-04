import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/data/datasources/service.dart';
import 'package:test/data/failure.dart';
import 'package:test/data/models/university.dart';
import 'package:test/domain/repositories/universities_repository_interface.dart';

class UniversitiesRepository implements UniversitiesRepositoryInterface {
  late RestClient client;

  UniversitiesRepository({required this.client});

  @override
  Future<Either<Failure, List<University>>> getUniversities() async {
    try {
      final result = await client.getUniversities() ?? [];
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
      return const Left(ServerFailure(''));
    }
  }
}
