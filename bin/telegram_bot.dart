import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class TelegramBot {
  static const BOT_TOKEN = '7248289349:AAHsuO13EBh37Nl287yKsA1s4TZ9Fydh5oM';
  // static const CHANNEL_ID = '@Gyro_Tracker';
  static const CHANNEL_ID = '@gjdh45uyj46jtryn57n6';

  late TeleDart teledart;

  telegramBotStart() async {
    // var username = (await Telegram(BOT_TOKEN).getMe()).username;
    // teledart = TeleDart(BOT_TOKEN, Event(username!));

    // teledart.start();
  }

  sendMessage(String msg) {
    // teledart.sendMessage(CHANNEL_ID, msg);
  }
}
