import 'package:dart_api/Data/Network/fetch_subgraph_proxy_api.dart';
import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
import 'package:dart_api/db/model/gyro_pool_snapshot_data_model.dart';

abstract class GydInfoDBRepository {
  save(GydStatusSnapshotDataModel gydInfoDb);
  List<GydStatusSnapshotDataModel> getLastGydInfoDb();
  List<GydStatusSnapshotDataModel> getGydInfoDbBeforSpecTime(
      int timeEpoch, int limit);
}
