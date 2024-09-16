import 'package:dart_api/Data/Network/api.dart';
import 'package:dio/dio.dart';

class FetchGydStatsApi implements Api<Response> {
  static const path =
      'https://europe-west2-gyroscope-ui.cloudfunctions.net/fetchGydStats';

  final _dio = Dio();

  @override
  Future<Response> get() async {
    return await _dio.post(path, data: {'period': "1Y"});
  }
}
