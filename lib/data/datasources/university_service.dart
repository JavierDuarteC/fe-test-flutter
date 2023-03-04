import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test/data/models/university.dart';

part 'university_service.g.dart';

@RestApi(baseUrl: "https://tyba-assets.s3.amazonaws.com/FE-Engineer-test")
abstract class UniversityServiceClient {
  factory UniversityServiceClient(Dio dio, {String baseUrl}) = _UniversityServiceClient;

  @GET("/universities.json")
  Future<List<University>?> getUniversities();
}