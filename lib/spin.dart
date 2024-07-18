import 'dart:convert';
import 'package:dart_api/db/model/UserDB.dart';
import 'package:dio/dio.dart';

class SpinAPI {
  static const path1 = 'https://api.spin.gyro.finance/user/';
  static const path2 =
      'https://api.spin.gyro.finance/user/0xECD793a0a99B60896226437105ef8F7d46A090Fb/rank';

  final _dio = Dio();

  Future<Response> _getHttp({required String path}) async {
    print(path);
    var tt = await _dio.get(path);
    return tt;
  }

  Future<AllSpin> getAllSpin() async {
    Response response = await _getHttp(path: path2);
    final result = jsonDecode(response.toString()) as Map<String, dynamic>;
    var t = AllSpin();
    t.total_users = result['total_users'] as int;
    t.total_points = result['total_points'] as double;
    return t;
  }

  Future<UserDB> getUserInfo({required String walletAddress}) async {
    try {
      print('call api');
      Response response = await _getHttp(path: path1 + walletAddress);
      print('call api2');

      Response response2 =
          await _getHttp(path: path1 + walletAddress + '/referrals');
      print('call api3');

      final user = jsonDecode(response.toString()) as Map<String, dynamic>;

      var hh2 = response2.data as List<dynamic>;

      var referrals = List<String>.empty(growable: true);

      for (var c in hh2) {
        var d = c as Map<String, dynamic>;
        referrals.add(d['address']);
      }

      // final referrals = jsonDecode(response2.toString()) as Map<String, dynamic>;

      // setState(() {
      //   _counter = user['cached_points'];
      // });

      // print(response2.toString());
      // var u = UserInfo();

      var uu = UserDB(
          address: walletAddress,
          referredBy: user['referred_by'],
          referredBy2nd: user['referred_by_2nd'],
          serverId: user['id'],
          totalPoints: user['total_points'],
          referrals: referrals);

      // u.total_points = user['total_points'] as double;
      // u.tvl_usd = user['tvl_usd'] as double;

      return uu;
      // print(user['cached_points']);
      // print(response.data.toString());
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }
}

class AllSpin {
  late int total_users;
  late double total_points;
}

class UserInfo {
  late String address;
  late double cached_points;
  late String created_at;
  late bool discord_connected;
  late bool has_capital;
  late int id;
  late String invite_code;

  late double points_to_next_tier;
  late int referral_boost;
  late double referral_points;
  late String referred_by;
  late String referred_by_2nd;
  late int successful_invites;
  late int tier;
  late int tier_jump;

  // "tier_jump_details": {
  // "councillor": 0,
  // "founding_frog": "Legendary",
  // "stress_test": true
  // },
  late double tier_points;
  late double total_bonus_points;
  late double total_points;
  late double tvl_usd;
  late bool twitter_connected;
}
