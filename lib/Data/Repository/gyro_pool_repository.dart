import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/Domain/Entity/gyro_pool_snapshot.dart';
import 'package:dart_api/Domain/Repository/gyro_pool_repository_interface.dart';
import 'package:dart_api/db/model/gyro_pool_snapshot_data_model.dart';
import 'package:dart_api/objectbox.g.dart';

class GyroPoolRepository implements GyroPoolRepositoryInterface {
  final Box<GyroPoolSnapshotDataModel> box;

  static const _ethereumNetworkId = 'ethereum';
  static const _optimismNetworkId = 'optimistic-ethereum';
  static const _gnosisNetworkId = 'xdai';
  static const _polygonNetworkId = 'polygon-pos';
  static const _polygonZKEVMNetworkId = 'polygon-zkevm';
  static const _baseNetworkId = 'base';
  static const _arbitrumNetworkId = 'arbitrum-one';
  static const _avalancheNetworkId = 'avalanche-network';

  GyroPoolRepository({required this.box});

  @override
  save(GyroPoolSnapshot gyroPoolSnapshot) {
    box.put(GyroPoolSnapshotDataModel.fromDomain(gyroPoolSnapshot));
    print(
        'GyroPoolSnapshot saved : chain : ${gyroPoolSnapshot.chainName} , tvl : ${gyroPoolSnapshot.tvl.toString()}');
  }

  @override
  double getLastTvlCaptured(ChainName chainName) {
    final last = box
        .query(GyroPoolSnapshotDataModel_.chainId.equals(chainName.index))
        .order(GyroPoolSnapshotDataModel_.time, flags: Order.descending)
        .build()
        .findFirst();
    if (last != null) {
      return last.tvl;
    } else {
      return 0.0;
    }
  }

  @override
  String getPoolNetworkId(ChainName chainName) {
    if (chainName == ChainName.ethereum) {
      return _ethereumNetworkId;
    } else if (chainName == ChainName.optimism) {
      return _optimismNetworkId;
    } else if (chainName == ChainName.gnosis) {
      return _gnosisNetworkId;
    } else if (chainName == ChainName.polygon) {
      return _polygonNetworkId;
    } else if (chainName == ChainName.polygonZKEVM) {
      return _polygonZKEVMNetworkId;
    } else if (chainName == ChainName.base) {
      return _baseNetworkId;
    } else if (chainName == ChainName.arbitrum) {
      return _arbitrumNetworkId;
    } else if (chainName == ChainName.avalanche) {
      return _avalancheNetworkId;
    } else {
      return "";
    }
  }
}
