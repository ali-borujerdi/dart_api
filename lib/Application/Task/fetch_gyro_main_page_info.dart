import 'package:dart_api/Data/MemoryDB/global_task.dart';
import 'package:dart_api/Data/Network/fetch_gyro_homepage_json_api.dart';
import 'package:dart_api/Domain/Entity/gyd_status_snapshot.dart';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';

class FetchGyroMainPageInfo {
  final GydStatusSnapshotRepositoryInterface repository;

  FetchGyroMainPageInfo({required this.repository});

  void run() async {
    var dPrice = 0.0;
    var dTotalTvl = 0.0;
    var dAllVolume = 0.0;
    var dGydAllVolume = 0.0;

    var response = await FetchGyroHomepageJsonApi().get();

    dPrice =
        _getGydPriceAsDouble(response.data['pageProps']['gydPrice'] as String);
    dTotalTvl =
        _getTotalTvlAsDouble(response.data['pageProps']['totalTVL'] as String);
    dAllVolume = _getAllVolumeAsDouble(
        response.data['pageProps']['allVolume'] as String);

    dGydAllVolume = _getGydAllVolumeAsDouble(
        response.data['pageProps']['gydAllVolume'] as String);

    var temp = GydStatusSnapshot(
        gydPrice: dPrice,
        gydAllVolume: dGydAllVolume,
        allVolume: dAllVolume,
        totalTVL: dTotalTvl,
        timeStamp: DateTime.now());

    repository.save(temp);

    print(dPrice);
    print(dTotalTvl);
    print(dAllVolume);
    print(dGydAllVolume);

    globalPostGydStatusToTelegram.run();
  }

  double _getGydPriceAsDouble(String response) {
    try {
      return double.parse(response);
    } catch (e) {
      return 0.0;
    }
  }

  double _getTotalTvlAsDouble(String response) {
    try {
      if (response.isNotEmpty) {
        if (response.endsWith('m')) {
          var t = response.substring(0, response.length - 1);
          var num = double.parse(t);
          num = num * 1000000;
          return num;
        } else if (response.endsWith('b')) {
          var t = response.substring(0, response.length - 1);
          var num = double.parse(t);
          num = num * 1000000000;
          return num;
        }
      }
      return 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  double _getAllVolumeAsDouble(String response) {
    try {
      if (response.isNotEmpty) {
        if (response.endsWith('b')) {
          var t = response.substring(0, response.length - 1);
          var num = double.parse(t);
          num = num * 1000000000;
          return num;
        }
      }
      return 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  double _getGydAllVolumeAsDouble(String response) {
    try {
      if (response.isNotEmpty) {
        if (response.endsWith('m')) {
          var t = response.substring(0, response.length - 1);
          var num = double.parse(t);
          num = num * 1000000;
          return num;
        } else if (response.endsWith('b')) {
          var t = response.substring(0, response.length - 1);
          var num = double.parse(t);
          num = num * 1000000000;
          return num;
        }
      }
      return 0.0;
    } catch (e) {
      return 0.0;
    }
  }
}
