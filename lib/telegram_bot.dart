import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class TelegramBot {
  // static const BOT_TOKEN = '7248289349:AAHsuO13EBh37Nl287yKsA1s4TZ9Fydh5oM';
  // static const CHANNEL_ID = '@Gyro_Tracker';

  static const TESTER_BOT_TOKEN =
      '7319282240:AAEXIHADKv1li3AetXSkz_AXOnn-24umHTU';
  static const CHANNEL_TESTER_ID = '@gjdh45uyj46jtryn57n6';

  late TeleDart teledart;

  telegramBotStart() async {
    var username = (await Telegram(TESTER_BOT_TOKEN).getMe()).username;
    teledart = TeleDart(TESTER_BOT_TOKEN, Event(username!));

    teledart.start();
  }

  sendMessage(String msg) {
    teledart.sendMessage(CHANNEL_TESTER_ID, msg);
  }
}