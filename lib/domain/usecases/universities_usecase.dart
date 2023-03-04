import 'package:test/data/models/university.dart';
import 'package:test/domain/repositories/universities_repository.dart';

class UniversitiesUseCase {
  final UniversitiesRepository repository;

  UniversitiesUseCase(this.repository);

  Future<List<University>> executeGetUniversities() async {
    final result = await repository.getUniversities();
    return result ?? [];
  }
}
