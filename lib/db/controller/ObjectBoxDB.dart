// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_api/db/model/UserDB.dart';
import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
import 'package:dart_api/objectbox.g.dart';

class ObjectBoxDB {
  final Store store;
  late Box<UserDB> box;
  late Box<GydStatusSnapshotDataModel> gydBox;

  ObjectBoxDB({required this.store}) {
    box = store.box<UserDB>();
    gydBox = store.box<GydStatusSnapshotDataModel>();
  }

  pubUser(UserDB user) {
    final id = box.put(user);
  }

  // putGydInfo(GydInfoDB gyd) {
  //   gydBox.put(gyd);
  // }

  // List<GydInfoDB> getLastFromTime(int timeEpoch) {
  //   Query<GydInfoDB> query = gydBox
  //       .query(GydInfoDB_.timeStamp.lessOrEqual(timeEpoch))
  //       .order(GydInfoDB_.timeStamp, flags: Order.descending)
  //       .build();
  //   query.limit = 3;
  //   List<GydInfoDB> uList = query.find();
  //   return uList;
  // }

  // List<GydInfoDB> getLastGydInfo() {
  //   Query<GydInfoDB> query = gydBox
  //       .query()
  //       .order(GydInfoDB_.timeStamp, flags: Order.descending)
  //       .build();
  //   query.limit = 1;
  //   List<GydInfoDB> uList = query.find();
  //   return uList;
  // }

  printAll() {
    Query<GydStatusSnapshotDataModel> query = gydBox.query().build();
    List<GydStatusSnapshotDataModel> uList = query.find();
    print('===table gyd===============');
    for (var i in uList) {
      print('id = ${i.dbId} price = ${i.gydPrice} time = ${i.timeStamp}');
    }
  }

  List<UserDB> find(String address) {
    Query<UserDB> query = box.query(UserDB_.address.equals(address)).build();
    List<UserDB> uList = query.find();
    query.close();
    return uList;
  }

  int size() {
    return box.count();
  }
}
