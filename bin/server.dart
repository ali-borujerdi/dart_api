import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import './spin.dart';
import './gyd_api.dart';
import './telegram_bot.dart';
import './timer.dart';

// ali

final user = UserInfo();
final gyd = GydInfo();
final spins = AllSpin();

final api = SpinAPI();
final api2 = GydApi();

final bot = TelegramBot();

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/point', _pointHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Response _pointHandler(Request request) {
  return Response.ok('${user.total_points}\n');
}

void main(List<String> args) async {
  /////////////////////
  ///
  // final Store store =Store(directory: "memory:test-db");
  /////////////////////
  bot.telegramBotStart();
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');

  // handleTimeout();
  // const timer = Duration(seconds: 60);
  // Timer.periodic(timer, (Timer t) => handleTimeout());

  var timer1 = MTimer(0, 1, handleTimeout, DateTime.now().minute);
  var timer2 = MTimer(1, 2, handleTimeout2, DateTime.now().minute);

  var handler1 = TimerHandler();
  handler1.addTimer(timer1);
  // handler1.addTimer(timer2);
}

void handleTimeout() async {
  try {
    var u = await api.getUserInfo(
        walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
    user.total_points = u.total_points;
    user.tvl_usd = u.tvl_usd;
    print('Get Point.. ${u.total_points}');

    var g2 = await api2.getApi();
    gyd.gydPrice = g2.gydPrice;
    gyd.gydAllVolume = g2.gydAllVolume;
    gyd.gydEthSupply = g2.gydEthSupply;
    print('Get GYD... Price : ${gyd.gydPrice}');

    var aaa = await api.getAllSpin();
    spins.total_users = aaa.total_users;
    spins.total_points = aaa.total_points;
  } catch (e) {
    print('eroorrororororo...');
  }

  if (gyd.gydAllVolume > 1000000.0) {
    var f = NumberFormat("###.00");
    final s = f.format(gyd.gydAllVolume / 1000000.0);

    var f2 = NumberFormat("#,###.##");
    final s2 = f2.format(spins.total_users);
    final s3 = f2.format(spins.total_points);
    // final s2 = f2.format(1000000);

    var f3 = NumberFormat("0.00000");
    final s4 = f3.format(gyd.gydPrice);
    final ss = f.format(gyd.gydEthSupply / 1000000.0);

    // bot.sendMessage(
    // '\n🔹GYD Stablecoin :\n▫️Price : \$$s4\n▫️Total Supply : \$${ss}M \n▫️Total Volume : \$${s}M \n\n🔹SPIN Camping :\n▫️Total Users : $s2\n▫️Total Points : $s3\n');
  }
}

void handleTimeout2() async {
  var u = await api.getUserInfo(
      walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
  user.total_points = u.total_points;
  user.tvl_usd = u.tvl_usd;
  print('Get Point.. ${u.total_points}');
  var g2 = await api2.getApi();
  gyd.gydPrice = g2.gydPrice;
  gyd.gydAllVolume = g2.gydAllVolume;
  print('Get GYD... Price : ${gyd.gydPrice}');

  var aaa = await api.getAllSpin();
  spins.total_users = aaa.total_users;
  spins.total_points = aaa.total_points;

  if (gyd.gydAllVolume > 1000000.0) {
    var f = NumberFormat("###.00");
    final s = f.format(gyd.gydAllVolume / 1000000.0);

    var f2 = NumberFormat("#,###.##");
    final s2 = f2.format(spins.total_users);
    final s3 = f2.format(spins.total_points);
    // final s2 = f2.format(1000000);

    var f3 = NumberFormat("0.00000");
    final s4 = f3.format(gyd.gydPrice);

    // bot.sendMessage(
    // '🔹SPIN Camping:\n▫️Total Users : $s2\n▫️Total Points : $s3\n');
  }

  // bot.sendMessage('GYD total volume = ${gyd.gydAllVolume}');
}
