import 'package:dart_api/Domain/Entity/gyd_info.dart';

abstract class GydInfoRepository {
  save(GydInfo gydInfoDb);
  List<GydInfo> getLastGydInfoFromWeb();
  List<GydInfo> getGydInfoBeforSpecTime(int timeEpoch, int limit);
}
