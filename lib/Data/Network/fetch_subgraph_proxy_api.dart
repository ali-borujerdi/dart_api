import 'dart:convert';

import 'package:dart_api/Data/MemoryDB/global_pools_tvl.dart';
import 'package:dart_api/Data/Network/api.dart';
import 'package:dart_api/Data/Network/get_token_price.dart';
import 'package:dio/dio.dart';

enum ChainName {
  ethereum,
  optimism,
  gnosis,
  polygon,
  polygonZKEVM,
  base,
  arbitrum,
  avalanche
}

class FetchSubgraphProxyApi implements Api<Response> {
  final _dio = Dio();
  final ChainName chainName;
  late final String _path;
  late final Map<String, String> _body;

  FetchSubgraphProxyApi({required this.chainName}) {
    _path = 'https://app.gyro.finance/api/${chainName.name}/subgraph-proxy/';
    _body = {
      'query':
          'query Pools { pools(where: {poolType_contains_nocase: \"gyro\"}) { name address totalLiquidity tokens { address balance } } }'
    };
  }

  @override
  Future<Response> get() async {
    print(_path);
    return await _dio.post(_path,
        data: _body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
  }
}

// void main(List<String> args) async {
//   var lolo1 = await GetTokenPrice().get2(
//       networkId: FetchSubgraphProxyApi.ethereumNetworkId,
//       tokenAddress: '0xe07f9d810a48ab5c3c914ba3ca53af14e4491e8a');
//   var lolo2 = await GetTokenPrice().get2(
//       networkId: FetchSubgraphProxyApi.arbitrumNetworkId,
//       tokenAddress: '0xca5d8f8a8d49439357d3cf46ca2e720702f132b8');
//   var l1 = num.parse(lolo1.toString());
//   var l2 = num.parse(lolo2.toString());
//   var l = (l1 + l2) / 2;
//   print('GYD Price : $l');
//   var test = FetchSubgraphProxyApi(chainName: ChainName.optimism);
//   var r = await test.get();
//   // final parsed = jsonDecode);
//   // print(r.data);
//   var pools = r.data['data']['pools'];
//   num number = 0.0;
//   var counter = 0;
//   for (var i in pools) {
//     // print(i);
//     num temp = 0.0;
//     // number += num.parse(i['totalLiquidity']);
//     counter++;
//     // await Future.delayed(Duration(milliseconds: 50));
//     for (var j in i['tokens']) {
//       try {
//         print(j['address']);
//         print(j['balance']);
//         var p = await GetTokenPrice().get2(
//             networkId: FetchSubgraphProxyApi.optimismNetworkId,
//             tokenAddress: j['address']);
//         temp += num.parse(j['balance']) * num.parse(p.data as String);
//       } catch (e) {
//         print(e);
//       }
//     }
//     number += temp;
//   }
//   basePoolTVL = number;
//   print(basePoolTVL);
//   print(counter);
// }
