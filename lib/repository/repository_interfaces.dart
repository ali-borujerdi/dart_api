import 'package:dart_api/db/model/GydInfoDB.dart';

abstract class GydInfoDBRepository {
  save(GydInfoDB gydInfoDb);
  List<GydInfoDB> getLastGydInfoDb();
  List<GydInfoDB> getGydInfoDbBeforSpecTime(int timeEpoch, int limit);
}
