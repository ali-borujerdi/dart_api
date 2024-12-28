import 'package:dart_api/Domain/Entity/gyd_status_snapshot.dart';

abstract class GydStatusSnapshotRepositoryInterface {
  save(GydStatusSnapshot gydStatusSnapshot);
  List<GydStatusSnapshot> getLastGydStatusSnapshot();
  List<GydStatusSnapshot> getGydInfoBeforSpecTime(int timeEpoch, int limit);
  double getTvlByDay(int year, int month, int day);
}
