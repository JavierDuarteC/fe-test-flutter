import 'package:dartz/dartz.dart';
import 'package:test/data/failure.dart';
import 'package:test/data/models/university.dart';

abstract class UniversitiesRepositoryInterface {
  Future<Either<Failure, List<University>?>> getUniversities();
}
