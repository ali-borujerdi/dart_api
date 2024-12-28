import 'package:dart_api/Data/Network/api.dart';
import 'package:dio/dio.dart';

class GetTokenPrice implements Api<Response> {
  static const path =
      'https://europe-west2-gyroscope-ui.cloudfunctions.net/getPrice';

  final _dio = Dio();

  Future<Response> get2(
      {required String networkId, required String tokenAddress}) async {
    var body =
        '{ "networkId" : "$networkId" , "tokenAddress" : "$tokenAddress"}';
    return await _dio.post(path,
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
  }

  @override
  Future<Response> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}

void main(List<String> args) async {
  var test = GetTokenPrice();
  var r = await test.get2(
      networkId: 'ethereum',
      tokenAddress: '0x24ae2da0f361aa4be46b48eb19c91e02c5e4f27e');

  print(r.data);
}
