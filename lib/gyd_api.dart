import 'dart:convert';
import 'package:dart_api/db/model/GydInfoDB.dart';
import 'package:dio/dio.dart';

class GydApi {
  static const path1 =
      'https://europe-west2-gyroscope-ui.cloudfunctions.net/fetchGydStats';

  static const path2 =
      'https://europe-west2-gyroscope-ui.cloudfunctions.net/fetchGydSupply';

  final _dio = Dio();

  Future<Response> _getHttp({required String path}) async {
    return await _dio.post(path, data: {'period': "1Y"});
  }

  Future<Response> _getHttp2({required String path}) async {
    return await _dio.post(path, data: {"network": "ethereum", "period": "1Y"});
  }

  Future<GydInfoDB> getApi() async {
    Response response = await _getHttp(path: path1);
    Response response2 = await _getHttp2(path: path2);
    var hh = response.data as List<dynamic>;
    var hh2 = response2.data as List<dynamic>;

    // var cc = await _dio.transformer.transformResponse(RequestOptions(),response.data);

    print(response.toString());
    print(response2.toString());

    final data = hh.last as Map<String, dynamic>;
    final data2 = hh2.last as Map<String, dynamic>;

    var ccc = data2['gydSupply'];

    if (ccc != null && ccc.length > 0) {
      ccc = ccc.substring(0, ccc.length - 18);
    }

    // var ddd = double.parse(ccc);
    // final jj = jsonDecode(data.toString());
    // print(data.toString());
    // print(ddd.toString());
    // print(data['totalReserveValue0']);

    var gydPrice = double.parse(data['gydPrice']);
    var gydAllVolume = double.parse(data['gydAllVolume']);
    var gydEthSupply = double.parse(ccc);

    var g = GydInfoDB(
        gydPrice: gydPrice,
        gydAllVolume: gydAllVolume,
        gydEthSupply: gydEthSupply);

    return g;

    // {gydCirculatingSupplyValue: 2861304.070017863386308275, totalReserveValue: 4862634.742216685150927007, gydMonthlyVolume: 30923682.120295078, allVolume: 1500748009.102151, dailyVolume: 6354903.315806637, gydSystemTVL: 9929618.509068988198198472, totalPoolTVL: 26535716.808207356257673506, monthlyVolume: 220615795.13217145, gydTotalSupply: 22200046.000002550190830023, totalTVL: 29397020.878225219643981781, gydTotalSupplyValue: 22213053.359115954113165362, gydDailyVolume: 1203553.0654718145, gydPoolTVL: 5066983.766852303047271465, gydCirculatingSupply: 2859628.568277077588707548, gydPrice: 1.000585915863120393, gydAllVolume: 143271946.23486143, timestamp: 1719941543}

    // print(user['cached_points']);
    // print(response.data.toString());
  }
}

// class GydInfo {
//   double gydPrice;
//   double gydAllVolume;
//   double gydEthSupply;
//   int timeStamp;

//   GydInfo({required this.gydPrice,required this.gydAllVolume,required this.gydEthSupply}) : timeStamp =  DateTime.now().millisecondsSinceEpoch;
// }
