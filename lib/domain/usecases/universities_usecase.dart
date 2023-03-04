import 'package:dartz/dartz.dart';
import 'package:test/data/failure.dart';
import 'package:test/data/models/university.dart';
import 'package:test/domain/repositories/universities_repository.dart';

class UniversitiesUseCase {
  final UniversitiesRepository repository;

  UniversitiesUseCase(this.repository);

  Future<Either<Failure, List<University>>> executeGetUniversities() {
    return repository.getUniversities();
  }
}
