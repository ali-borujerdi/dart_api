import 'package:dart_api/Domain/Entity/gyd_info.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/Domain/Usecase/util/usecase.dart';

class GetLastGydInfoFromWebUsecase implements UseCase<GydInfo, NoParams> {
  final GydInfoRepository repository;

  GetLastGydInfoFromWebUsecase({required this.repository});

  @override
  Future<GydInfo> call(NoParams params) async {
    var g = repository.getLastGydInfoFromWeb();
    if (g.isNotEmpty) {
      repository.save(g.first);
      return g.first;
    } else {
      return Future.error("dis");
    }
  }
}
