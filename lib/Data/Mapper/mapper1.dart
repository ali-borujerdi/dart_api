import 'package:dart_api/db/model/GydInfoDB.dart';
import 'package:dio/dio.dart';

class Mapper1 {
  static GydInfoDB map(Response response) {
    var hh = response.data as List<dynamic>;
    final data = hh.last as Map<String, dynamic>;
    var gydPrice = double.parse(data['gydPrice']);
    var gydAllVolume = double.parse(data['gydAllVolume']);
    var g = GydInfoDB(
        gydPrice: gydPrice, gydAllVolume: gydAllVolume, gydEthSupply: 0);
    return g;
  }
}
