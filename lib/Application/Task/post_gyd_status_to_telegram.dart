import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/telegram_bot.dart';
import 'package:intl/intl.dart';

class PostGydStatusToTelegram {
  final TelegramBot bot;
  final GydStatusSnapshotRepositoryInterface repository;

  PostGydStatusToTelegram({required this.bot, required this.repository});

  void run() {
    var result = repository.getLastGydStatusSnapshot();

    if (result.isNotEmpty) {
      var gyd = result.first;
      var msg = '\n🔹GYD Stablecoin:';
      msg += '\n ▫️Price : <b> \$${_price(gyd.gydPrice)} </b>';
      msg += '\n ▫️Total Volume : <b>\$${_test(gyd.gydAllVolume)}</b>';
      msg += '\n';
      msg += '\n🔹Gyroscope Pools:';
      msg += '\n ▫️TVL : <b> \$${_test(gyd.totalTVL)}</b>';
      msg += '\n ▫️Total Volume : <b> \$${_test(gyd.allVolume)}</b>';
      bot.sendMessage(msg);
    }
  }

  String _price(double price) {
    // NumericAxis();
    // LineChart(primaryMeasureAxis:);

    var f = NumberFormat("0.0000");
    return f.format(price);
  }

  String _test(double gydAllVolume) {
    if (gydAllVolume > 1000000000.0) {
      var f = NumberFormat("#,###.##");
      final s = f.format(gydAllVolume / 1000000000.0);
      return "${s}B";
    } else if (gydAllVolume > 1000000.0) {
      var f = NumberFormat("#,###.##");
      final s = f.format(gydAllVolume / 1000000.0);
      return "${s}M";
    }
    return "";
  }
}

class TimeSeriesData {
  final DateTime date;
  final double value;

  TimeSeriesData(this.date, this.value);
}
