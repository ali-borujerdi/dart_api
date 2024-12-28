import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
import 'package:dart_api/db/model/gyro_pool_snapshot_data_model.dart';
import 'package:dart_api/objectbox.g.dart';

late Store globalStore;

final Box<GyroPoolSnapshotDataModel> box1 =
    globalStore.box<GyroPoolSnapshotDataModel>();

final Box<GydStatusSnapshotDataModel> box2 =
    globalStore.box<GydStatusSnapshotDataModel>();
