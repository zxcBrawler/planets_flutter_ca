import 'package:books_api/core/constants/constans.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/planet_model.dart';

part 'planets_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PlanetsApiService {
  factory PlanetsApiService(Dio dio) = _PlanetsApiService;

  @GET('min_mass={minMass}')
  Future<HttpResponse<List<PlanetModel>>> getPlanets({
    @Query("X-Api-Key") String? apiKey = apiKey,
    @Query("min_mass") double? minMass = 1,
  });

  @GET('min_radius={minRadius}')
  Future<HttpResponse<List<PlanetModel>>> getPlanetsWithMinRadius({
    @Query("X-Api-Key") String? apiKey = apiKey,
    @Query("min_radius") double? minRadius = 1,
  });
  @GET('min_temperature={minTemp}')
  Future<HttpResponse<List<PlanetModel>>> getPlanetsWithMinTemp({
    @Query("X-Api-Key") String? apiKey = apiKey,
    @Query("min_temperature") double? minTemp = 1,
  });
}
