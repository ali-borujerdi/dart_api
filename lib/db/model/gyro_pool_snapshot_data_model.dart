import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/Domain/Entity/gyro_pool_snapshot.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GyroPoolSnapshotDataModel {
  @Id()
  int dbId;

  int chainId;

  double tvl;

  int time;

  GyroPoolSnapshotDataModel(
      {this.dbId = 0,
      required this.chainId,
      required this.tvl,
      required this.time});

  factory GyroPoolSnapshotDataModel.fromDomain(
      GyroPoolSnapshot gyroPoolSnapshot) {
    return GyroPoolSnapshotDataModel(
        chainId: gyroPoolSnapshot.chainName.index,
        tvl: gyroPoolSnapshot.tvl,
        time: gyroPoolSnapshot.takenAt.millisecondsSinceEpoch);
  }
}
