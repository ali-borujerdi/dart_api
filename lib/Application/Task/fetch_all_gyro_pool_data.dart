import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/Data/Network/get_token_price.dart';
import 'package:dart_api/Domain/Entity/gyro_pool_snapshot.dart';
import 'package:dart_api/Domain/Repository/gyro_pool_repository_interface.dart';

class FetchAllGyroPoolData {
  final GyroPoolRepositoryInterface repository;

  FetchAllGyroPoolData({required this.repository});

  void run() async {
    for (var chain in ChainName.values) {
      var response = await FetchSubgraphProxyApi(chainName: chain).get();
      var pools = response.data['data']['pools'];
      double number = 0.0;
      // var counter = 0;
      for (var pool in pools) {
        if (pool['address'] == '0x2191df821c198600499aa1f0031b1a7514d7a7d9') {
          print('+++one pool break');
        } else {
          num temp = 0.0;
          for (var token in pool['tokens']) {
            try {
              // print(token['address']);
              // print(token['balance']);
              var p = await GetTokenPrice().get2(
                  networkId: repository.getPoolNetworkId(chain),
                  tokenAddress: token['address']);
              temp += double.parse(token['balance']) *
                  double.parse(p.data as String);
            } catch (e) {
              print(e);
            }
          }
          number += temp;
        }
      }
      var m = GyroPoolSnapshot(
          chainName: chain, tvl: number, takenAt: DateTime.now());
      repository.save(m);
    }
  }
}
