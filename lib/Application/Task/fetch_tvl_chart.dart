import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dart_api/Domain/Repository/gyd_info_repository.dart';
import 'package:dart_api/telegram_bot.dart';
import 'package:dart_api/Data/Network/quick_chart_api.dart';

class FetchTvlChart {
  final TelegramBot bot;
  final GydStatusSnapshotRepositoryInterface repository;
  FetchTvlChart({required this.bot, required this.repository});

  void run() async {
    var today = DateTime.now();
    List<DateTime> past7Days = [];
    // past7Days.add(today);
    for (int i = 0; i < 7; i++) {
      past7Days.add(today.subtract(Duration(days: i)));
    }

    List<double> past7DaysTvl = [];

    var lastNoneZero = 0.0;
    for (var i in past7Days) {
      var tvl = repository.getTvlByDay(i.year, i.month, i.day);
      if (tvl == 0.0) {
        past7DaysTvl.add(lastNoneZero);
      } else {
        past7DaysTvl.add(tvl);
        lastNoneZero = tvl;
      }
    }

    List<String> labels = [];

    for (var i in past7Days) {
      labels.add(i.day.toString());
    }

    final api = QuickChartApi(labels: labels, data: past7DaysTvl);

    final file = File('chart.png');
    var response = await api.get();

    // var base64 = response.data.split(';base64,');
    // base64 = base64.replaceFirst('binary data/', '');
    // Uint8List bytes = base64Decode(base64);

    // print(response.data);
    Uint8List fileBytes = base64Decode(response.data);
    // Uint8List fileBytes = Uint8List.fromList(response.data);
    await file.writeAsBytes(fileBytes);
    // await file.writeAsBytes(
    // await response.data.expand((element) => element).toList());
    bot.sendPhoto(file, 'test chart');
  }
}
