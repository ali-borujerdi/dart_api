import 'package:dart_api/Data/Mapper/mapper1.dart';
import 'package:dart_api/Data/Network/fetch_gyd_stats_api.dart';
import 'package:dart_api/Domain/Entity/gyd_info.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/db/model/GydInfoDB.dart';
import 'package:dart_api/objectbox.g.dart';

class GydInfoRepositoryImplement implements GydInfoRepository {
  final Store store;
  late Box<GydInfoDB> _box;

  final FetchGydStatsApi api1;

  GydInfoRepositoryImplement({required this.store, required this.api1});

  @override
  List<GydInfo> getGydInfoBeforSpecTime(int timeEpoch, int limit) {
    // TODO: implement getGydInfoDbBeforSpecTime
    throw UnimplementedError();
  }

  @override
  List<GydInfo> getLastGydInfoFromWeb() {
    var c = api1.get().then((value) => Mapper1.map(value));

    // TODO: implement getLastGydInfoFromWeb
    throw UnimplementedError();
  }

  @override
  save(GydInfo gydInfoDb) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
