import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test/data/models/university.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://tyba-assets.s3.amazonaws.com/FE-Engineer-test")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/universities.json")
  Future<List<University>?> getUniversities();
}