import 'package:dart_api/Domain/Entity/gyd_status_snapshot.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GydStatusSnapshotDataModel {
  @Id()
  int dbId;

  double gydPrice;
  double gydAllVolume;
  double totalTVL;
  double allVolume;
  int timeStamp;

  GydStatusSnapshotDataModel({
    this.dbId = 0,
    required this.gydPrice,
    required this.gydAllVolume,
    required this.totalTVL,
    required this.allVolume,
    required this.timeStamp,
  });

  factory GydStatusSnapshotDataModel.fromDomain(GydStatusSnapshot domain) {
    return GydStatusSnapshotDataModel(
        gydPrice: domain.gydPrice,
        gydAllVolume: domain.gydAllVolume,
        allVolume: domain.allVolume,
        totalTVL: domain.totalTVL,
        timeStamp: domain.timeStamp.millisecondsSinceEpoch);
  }

  GydStatusSnapshot toDomain() {
    return GydStatusSnapshot(
        allVolume: allVolume,
        gydAllVolume: gydAllVolume,
        gydPrice: gydPrice,
        totalTVL: totalTVL,
        timeStamp: DateTime.fromMillisecondsSinceEpoch(timeStamp));
  }
}
