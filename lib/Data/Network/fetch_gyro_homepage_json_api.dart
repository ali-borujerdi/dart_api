import 'package:dio/dio.dart';
import 'api.dart';

class FetchGyroHomepageJsonApi implements Api<Response> {
  final _dio = Dio();
  final String _path =
      'https://www.gyro.finance/_next/data/yY34RCPA8NUNMQTilLOyI/index.json';

  @override
  Future<Response> get() async {
    return await _dio.get(_path);
  }
}
