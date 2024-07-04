import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import './spin.dart';
import './gyd_api.dart';

// ali

final user = UserInfo();
final gyd = GydInfo();

final api = SpinAPI();
final api2 = GydApi();


// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/point',_pointHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Response _pointHandler(Request request){
  return Response.ok('${user.total_points}\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');

  handleTimeout();
  const timer = Duration(seconds:20);
  Timer.periodic(timer, (Timer t) => handleTimeout());

}

void handleTimeout() async{
  var u = await api.getUserInfo(walletAddress: '0xECD793a0a99B60896226437105ef8F7d46A090Fb');
  user.total_points = u.total_points;
  user.tvl_usd = u.tvl_usd;
  print('Get Point.. ${u.total_points}');
  var g2 = await api2.getApi();
  gyd.gydPrice = g2.gydPrice;
  gyd.gydAllVolume = g2.gydAllVolume;
  print('Get GYD... Price : ${gyd.gydPrice}');
}
