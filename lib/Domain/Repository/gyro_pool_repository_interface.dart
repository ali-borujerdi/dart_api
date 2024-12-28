import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/Domain/Entity/gyro_pool_snapshot.dart';

abstract class GyroPoolRepositoryInterface {
  save(GyroPoolSnapshot gyroPoolSnapshot);
  double getLastTvlCaptured(ChainName chainName);
  String getPoolNetworkId(ChainName chainName);
}
