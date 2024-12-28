import 'package:dart_api/Data/MemoryDB/global_database.dart';
import 'package:dart_api/Data/Repository/gyd_status_snapshot_repository.dart';
import 'package:dart_api/Data/Repository/gyro_pool_repository.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/Domain/Repository/gyro_pool_repository_interface.dart';

final GyroPoolRepositoryInterface globalGyroPoolRepository =
    GyroPoolRepository(box: box1);

final GydStatusSnapshotRepositoryInterface globalGydStatusSnapshotRepository =
    GydStatusSnapshotRepository(box: box2);
