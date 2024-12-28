// import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
// import 'package:dart_api/objectbox.g.dart';
// import 'package:dart_api/repository/repository_interfaces.dart';

// class GydInfoDbDataRepository implements GydInfoDBRepository {
//   final Store store;
//   late Box<GydStatusSnapshotDataModel> _box;

//   GydInfoDbDataRepository({required this.store}) {
//     _box = store.box<GydStatusSnapshotDataModel>();
//   }

//   @override
//   List<GydStatusSnapshotDataModel> getGydInfoDbBeforSpecTime(
//       int timeEpoch, int limit) {
//     Query<GydStatusSnapshotDataModel> query = _box
//         .query(GydInfoDB_.timeStamp.lessOrEqual(timeEpoch))
//         .order(GydInfoDB_.timeStamp, flags: Order.descending)
//         .build();
//     query.limit = limit;
//     List<GydStatusSnapshotDataModel> uList = query.find();
//     return uList;
//   }

//   @override
//   List<GydStatusSnapshotDataModel> getLastGydInfoDb() {
//     Query<GydStatusSnapshotDataModel> query = _box
//         .query()
//         .order(GydInfoDB_.timeStamp, flags: Order.descending)
//         .build();
//     query.limit = 1;
//     List<GydStatusSnapshotDataModel> uList = query.find();
//     return uList;
//   }

//   @override
//   save(GydStatusSnapshotDataModel gydInfoDb) {
//     _box.put(gydInfoDb);
//   }
// }
