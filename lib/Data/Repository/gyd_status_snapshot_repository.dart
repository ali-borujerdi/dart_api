import 'package:dart_api/Domain/Entity/gyd_status_snapshot.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
import 'package:dart_api/objectbox.g.dart';

class GydStatusSnapshotRepository
    implements GydStatusSnapshotRepositoryInterface {
  final Box<GydStatusSnapshotDataModel> box;

  // final FetchGydStatsApi api1;

  GydStatusSnapshotRepository({required this.box});

  @override
  List<GydStatusSnapshot> getGydInfoBeforSpecTime(int timeEpoch, int limit) {
    // TODO: implement getGydInfoDbBeforSpecTime
    throw UnimplementedError();
  }

  @override
  List<GydStatusSnapshot> getLastGydStatusSnapshot() {
    final last = box
        .query()
        .order(GydStatusSnapshotDataModel_.timeStamp, flags: Order.descending)
        .build()
        .findFirst();
    if (last != null) {
      return [last.toDomain()];
    } else {
      return [];
    }
  }

  @override
  save(GydStatusSnapshot gydStatusSnapshot) {
    var dataModel = GydStatusSnapshotDataModel.fromDomain(gydStatusSnapshot);
    box.put(dataModel);
  }

  @override
  double getTvlByDay(int year, int month, int day) {
    var startOfDay = DateTime(year, month, day, 0, 0, 0, 0, 0);
    var endOfDay = DateTime(year, month, day, 23, 59, 59, 999, 999);
    final query = box
        .query(GydStatusSnapshotDataModel_.timeStamp
            .greaterOrEqual(startOfDay.millisecondsSinceEpoch)
            .and(GydStatusSnapshotDataModel_.timeStamp
                .lessOrEqual(endOfDay.millisecondsSinceEpoch)))
        .build();
    final resault = query.find();
    var counter = 0;
    double sum = 0.0;
    for (var r in resault) {
      counter += 1;
      sum += r.totalTVL;
    }
    if (counter > 0) {
      sum = sum / counter;
    }
    return sum;
  }
}
