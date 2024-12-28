import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:dart_api/Core/Timing/scheduled_task.dart';
import 'package:dart_api/Data/MemoryDB/global_bot.dart';
import 'package:dart_api/Data/MemoryDB/global_database.dart';
import 'package:dart_api/Data/MemoryDB/global_task.dart';
import 'package:dart_api/db/controller/ObjectBoxDB.dart';
import 'package:dart_api/db/model/gyd_status_snapshot_data_model.dart';
import 'package:dart_api/objectbox.g.dart';
import 'package:dart_api/repository/gyd_info_db_data_repository.dart';
import 'package:dart_api/repository/repository_interfaces.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'spin.dart';
import 'Data/Network/old/gyd_api.dart';
import 'telegram_bot.dart';
import 'Core/Timing/timing_handler.dart';

// ali

late GydInfoDBRepository gydRepository;

final user = UserInfo();
// late GydInfoDB gyd;
List<GydStatusSnapshotDataModel> gyd = List.empty(growable: true);

final spins = AllSpin();

final api = SpinAPI();
final api2 = GydApi();

// final bot = TelegramBot();

// late ObjectBoxDB db;

int counter = 0;

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
  try {
    // DynamicLibrary.open('./lib/libobjectbox.so');
    globalStore = Store(getObjectBoxModel(), directory: "/db");
  } catch (e) {
    print(e);
  }

  globalTesterBot.telegramBotStart();
  globalProductBot.telegramBotStart();

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');

  var fetchAllGyroPoolDataTimer = ScheduledTask(
      59, 10, globalFetchGyroMainPageInfo.run, DateTime.now().minute);
  // var timer2 = MTimer(1, 2, handleTimeout2, DateTime.now().minute);

  var timer3 = ScheduledTask(
      0, 10, globalPostGydStatusToTelegram.run, DateTime.now().minute);

  var timer2 =
      ScheduledTask(1, 2, globalFetchTvlChart.run, DateTime.now().minute);

  // fetchUsers('0x37c6726459872BdbB464C65eAeB44a6155Ade3C2');
  var handler1 = TimingHandler();

  handler1.addTimer(fetchAllGyroPoolDataTimer);
  handler1.addTimer(timer3);
  // handler1.addTimer(timer1);
  // handler1.addTimer(timer2);
}

// _fetchAndPut(String address) async {
//   var u = await api.getUserInfo(walletAddress: address);
//   await db.pubUser(u);
//   print('db add user : ${u.address}');
// }

// fetchUsers(String address) async {
//   // await Future.delayed(Duration(seconds: 2));

//   print(counter);
//   counter++;
//   var tempUser = db.find(address);

//   if (tempUser.isEmpty) {
//     // await Future.delayed(Duration(seconds: 3));
//     // sleep(Duration(seconds: 10));

//     // var u = await api.getUserInfo(walletAddress: address);
//     // await db.pubUser(u);
//     await _fetchAndPut(address);

//     var tempUser2 = db.find(address);
//     var u = tempUser2.first;

//     if (u.referredBy != u.address) {
//       fetchUsers(u.referredBy);
//     }
//     if (u.referredBy2nd != u.address) {
//       fetchUsers(u.referredBy2nd);
//     }
//     for (var i in u.referrals) {
//       // sleep(Duration(seconds: 10));
//       fetchUsers(i);
//     }
//   } else {
//     var uu = tempUser.first;
//     if (uu.referredBy != uu.address) {
//       fetchUsers(uu.referredBy);
//     }
//     if (uu.referredBy2nd != uu.address) {
//       fetchUsers(uu.referredBy2nd);
//     }
//     for (var i in uu.referrals) {
//       // sleep(Duration(seconds: 10));
//       fetchUsers(i);
//     }
//   }

// try {
//   var u = await api.getUserInfo(walletAddress: address);
//   print('Get User.. ${u.address}');

//   var tempUser = db.find('0xECD793a0a99B60896226437105ef8F7d46A090Fb');
//   if (tempUser.isEmpty) {
//     db.pubUser(u);
//     print('db add user');
//   }
// } catch (e) {}
// }

// void handleTimeout() async {
//   try {
//     var u = await api.getUserInfo(
//         walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
//     user.total_points = u.totalPoints;
//     user.tvl_usd = 0.0;
//     print('Get Point.. ${u.totalPoints}');

//     var tempUser = db.find('0xECD793a0a99B60896226437105ef8F7d46A090Fb');
//     if (tempUser.isEmpty) {
//       db.pubUser(u);
//       print('db add user');
//     }

//     // gyd = await api2.getApi();

//     gyd[0] = gydRepository.getLastGydInfoDb().first;

//     // gyd.gydPrice = g2.gydPrice;
//     // gyd.gydAllVolume = g2.gydAllVolume;
//     // gyd.gydEthSupply = g2.gydEthSupply;
//     gyd.isNotEmpty ? print('Get GYD... Price : ${gyd[0].gydPrice}') : {};

//     var aaa = await api.getAllSpin();
//     spins.total_users = aaa.total_users;
//     spins.total_points = aaa.total_points;
//   } catch (e) {
//     print('eroorrororororo... = ${e.toString()}');
//   }

//   if (gyd.isNotEmpty) {
//     if (gyd[0].gydAllVolume > 1000000.0) {
//       var f = NumberFormat("###.00");
//       final s = f.format(gyd[0].gydAllVolume / 1000000.0);

//       var f2 = NumberFormat("#,###.##");
//       final s2 = f2.format(spins.total_users);
//       final s3 = f2.format(spins.total_points);
//       // final s2 = f2.format(1000000);
//       print('testtt');
//       var f3 = NumberFormat("0.00000");
//       final s4 = f3.format(gyd[0].gydPrice);
//       final ss = f.format(gyd[0].gydEthSupply / 1000000.0);

//       bot.sendMessage(
//           '\n🔹GYD Stablecoin :\n▫️Price : \$$s4\n▫️Total Supply : \$${ss}M \n▫️Total Volume : \$${s}M \n\n🔹SPIN Camping :\n▫️Total Users : $s2\n▫️Total Points : $s3\n');
//     }
//   }
// }

void dbHandlerTimeout() async {
  try {
    // var u = await api.getUserInfo(
    //     walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
    // user.total_points = u.totalPoints;
    // user.tvl_usd = 0.0;
    // print('Get Point.. ${u.totalPoints}');

    // var tempUser = db.find('0xECD793a0a99B60896226437105ef8F7d46A090Fb');
    // if (tempUser.isEmpty) {
    //   db.pubUser(u);
    //   print('db add user');
    // }

    gyd.clear();
    gyd.add(await api2.getApi());
    // gyd.gydPrice = g2.gydPrice;
    // gyd.gydAllVolume = g2.gydAllVolume;
    // gyd.gydEthSupply = g2.gydEthSupply;
    print('Get GYD... Price : ${gyd[0].gydPrice}');

    gydRepository.save(gyd[0]);
    // db.putGydInfo(gyd[0]);

    // var aaa = await api.getAllSpin();
    // spins.total_users = aaa.total_users;
    // spins.total_points = aaa.total_points;
  } catch (e) {
    print('eroorrororororo... = ${e.toString()}');
  }
}

void handleTimeout2() async {
  var u = await api.getUserInfo(
      walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
  user.total_points = u.totalPoints;
  user.tvl_usd = 1.0;
  print('Get Point.. ${u.totalPoints}');
  gyd[0] = await api2.getApi();
  // gyd.gydPrice = g2.gydPrice;
  // gyd.gydAllVolume = g2.gydAllVolume;
  print('Get GYD... Price : ${gyd[0].gydPrice}');

  var aaa = await api.getAllSpin();
  spins.total_users = aaa.total_users;
  spins.total_points = aaa.total_points;

  if (gyd.isNotEmpty) {
    if (gyd[0].gydAllVolume > 1000000.0) {
      var f = NumberFormat("###.00");
      final s = f.format(gyd[0].gydAllVolume / 1000000.0);

      var f2 = NumberFormat("#,###.##");
      final s2 = f2.format(spins.total_users);
      final s3 = f2.format(spins.total_points);
      // final s2 = f2.format(1000000);

      var f3 = NumberFormat("0.00000");
      final s4 = f3.format(gyd[0].gydPrice);

      // bot.sendMessage(
      // '🔹SPIN Camping:\n▫️Total Users : $s2\n▫️Total Points : $s3\n');
    }
  }

  // bot.sendMessage('GYD total volume = ${gyd.gydAllVolume}');
}
