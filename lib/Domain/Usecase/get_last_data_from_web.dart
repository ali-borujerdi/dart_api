import 'package:dart_api/Domain/Entity/gyd_status_snapshot.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/Domain/Usecase/util/usecase.dart';

class GetLastGydInfoFromWebUsecase
    implements UseCase<GydStatusSnapshot, NoParams> {
  final GydStatusSnapshotRepositoryInterface repository;

  GetLastGydInfoFromWebUsecase({required this.repository});

  @override
  Future<GydStatusSnapshot> call(NoParams params) async {
    var g = repository.getLastGydStatusSnapshot();
    if (g.isNotEmpty) {
      repository.save(g.first);
      return g.first;
    } else {
      return Future.error("dis");
    }
  }
}
