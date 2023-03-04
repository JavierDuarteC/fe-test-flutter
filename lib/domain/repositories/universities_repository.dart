import 'package:test/data/datasources/university_service.dart';
import 'package:test/data/models/university.dart';
import 'package:test/domain/repositories/universities_repository_interface.dart';

class UniversitiesRepository implements UniversitiesRepositoryInterface{
  late UniversityServiceClient client;

  UniversitiesRepository({required this.client});

  @override
  Future<List<University>?> getUniversities() {
    return client.getUniversities();
  }
}