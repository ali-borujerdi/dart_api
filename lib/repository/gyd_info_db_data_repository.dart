import 'package:dart_api/db/model/GydInfoDB.dart';
import 'package:dart_api/objectbox.g.dart';
import 'package:dart_api/repository/repository_interfaces.dart';

class GydInfoDbDataRepository implements GydInfoDBRepository {
  final Store store;
  late Box<GydInfoDB> _box;

  GydInfoDbDataRepository({required this.store}) {
    _box = store.box<GydInfoDB>();
  }

  @override
  List<GydInfoDB> getGydInfoDbBeforSpecTime(int timeEpoch, int limit) {
    Query<GydInfoDB> query = _box
        .query(GydInfoDB_.timeStamp.lessOrEqual(timeEpoch))
        .order(GydInfoDB_.timeStamp, flags: Order.descending)
        .build();
    query.limit = limit;
    List<GydInfoDB> uList = query.find();
    return uList;
  }

  @override
  List<GydInfoDB> getLastGydInfoDb() {
    Query<GydInfoDB> query = _box
        .query()
        .order(GydInfoDB_.timeStamp, flags: Order.descending)
        .build();
    query.limit = 1;
    List<GydInfoDB> uList = query.find();
    return uList;
  }

  @override
  save(GydInfoDB gydInfoDb) {
    _box.put(gydInfoDb);
  }
}
