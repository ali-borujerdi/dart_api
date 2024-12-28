import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

enum TelegromBotType { product, test }

class TelegramBot {
  static const BOT_TOKEN = '7248289349:AAHsuO13EBh37Nl287yKsA1s4TZ9Fydh5oM';
  static const CHANNEL_ID = '@Gyro_Tracker';

  static const TESTER_BOT_TOKEN =
      '7319282240:AAEXIHADKv1li3AetXSkz_AXOnn-24umHTU';
  static const CHANNEL_TESTER_ID = '@gjdh45uyj46jtryn57n6';

  late TeleDart teledart;
  final TelegromBotType type;

  TelegramBot({required this.type});

  telegramBotStart() async {
    if (type == TelegromBotType.test) {
      var username = (await Telegram(TESTER_BOT_TOKEN).getMe()).username;
      teledart = TeleDart(TESTER_BOT_TOKEN, Event(username!));
      teledart.start();
    } else if (type == TelegromBotType.product) {
      var username = (await Telegram(BOT_TOKEN).getMe()).username;
      teledart = TeleDart(BOT_TOKEN, Event(username!));
      teledart.start();
    }
  }

  sendMessage(String msg) {
    if (type == TelegromBotType.test) {
      teledart.sendMessage(CHANNEL_TESTER_ID, msg, parseMode: 'HTML');
    } else if (type == TelegromBotType.product) {
      teledart.sendMessage(CHANNEL_ID, msg, parseMode: 'HTML');
    }
  }

  sendPhoto(Object photo, String msg) {
    if (type == TelegromBotType.test) {
      teledart.sendPhoto(CHANNEL_TESTER_ID, photo, caption: msg);
    } else if (type == TelegromBotType.product) {
      teledart.sendPhoto(CHANNEL_ID, photo, caption: msg);
    }
  }
}
