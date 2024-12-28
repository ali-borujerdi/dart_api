import 'package:dart_api/Application/Task/fetch_all_gyro_pool_data.dart';
import 'package:dart_api/Application/Task/fetch_gyro_main_page_info.dart';
import 'package:dart_api/Application/Task/fetch_tvl_chart.dart';
import 'package:dart_api/Application/Task/post_data_to_telegram.dart';
import 'package:dart_api/Application/Task/post_gyd_status_to_telegram.dart';
import 'package:dart_api/Data/MemoryDB/global_bot.dart';
import 'package:dart_api/Data/MemoryDB/global_repository.dart';

final FetchAllGyroPoolData globalFetchAllGyroPoolData =
    FetchAllGyroPoolData(repository: globalGyroPoolRepository);

final FetchGyroMainPageInfo globalFetchGyroMainPageInfo =
    FetchGyroMainPageInfo(repository: globalGydStatusSnapshotRepository);

final PostDataToTelegram globalPostDataToTelegram = PostDataToTelegram(
    repository: globalGyroPoolRepository, bot: globalTesterBot);

final PostGydStatusToTelegram globalPostGydStatusToTelegram =
    PostGydStatusToTelegram(
        repository: globalGydStatusSnapshotRepository, bot: globalProductBot);

final FetchTvlChart globalFetchTvlChart = FetchTvlChart(
    bot: globalTesterBot, repository: globalGydStatusSnapshotRepository);
