import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';

class GyroPoolSnapshot {
  // final String id;
  final ChainName chainName;
  final double tvl;
  final DateTime takenAt;

  GyroPoolSnapshot(
      {
      // required this.id,
      required this.chainName,
      required this.tvl,
      required this.takenAt});
}
