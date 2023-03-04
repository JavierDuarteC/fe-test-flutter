import 'package:test/data/models/university.dart';

abstract class UniversitiesRepositoryInterface {
  Future<List<University>?> getUniversities();
}
