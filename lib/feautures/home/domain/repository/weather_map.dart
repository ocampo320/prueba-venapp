import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:dartz/dartz.dart';
import 'package:kncha_app/feautures/home/domain/services/weather_map_services.dart';
class WeatherMap{
  Future<Either<CommonFailure, String>> save(String city,String date) async {
    try {
         final data  = await WeatherMapServices.getWeatherMapServices(city, date);
      return right(data);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }
}