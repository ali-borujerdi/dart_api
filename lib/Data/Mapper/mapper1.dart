// import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
// import 'package:dio/dio.dart';

// class Mapper1 {
//   static GydStatusSnapshotDataModel map(Response response) {
//     var hh = response.data as List<dynamic>;
//     final data = hh.last as Map<String, dynamic>;
//     var gydPrice = double.parse(data['gydPrice']);
//     var gydAllVolume = double.parse(data['gydAllVolume']);
//     var g = GydStatusSnapshotDataModel(
//         gydPrice: gydPrice, gydAllVolume: gydAllVolume, gydEthSupply: 0);
//     return g;
//   }
// }
