import 'package:objectbox/objectbox.dart';

@Entity()
class UserDB {
  @Id()
  int id;

  String address;

  String referredBy;

  double totalPoints;

  UserDB(
      {required this.id,
      required this.address,
      required this.referredBy,
      required this.totalPoints});
}

// {
//     "address": "0xECD793a0a99B60896226437105ef8F7d46A090Fb",
//     "cached_points": 57822.140893200114,
//     "created_at": "Tue, 19 Mar 2024 14:23:17 GMT",
//     "discord_connected": true,
//     "has_capital": true,
//     "id": 127,
//     "invite_code": "YQMG39",
//     "points_to_next_tier": 39963779.29544963,
//     "referral_boost": 1,
//     "referral_points": 4856.98180624035,
//     "referred_by": "0xFE042b1Aeb471CFf2e1A6709E5682533D19CbCc7",
//     "referred_by_2nd": "0x37c6726459872BdbB464C65eAeB44a6155Ade3C2",
//     "successful_invites": 9,
//     "tier": 5,
//     "tier_jump": 3,
//     "tier_jump_details": {
//         "councillor": 0,
//         "founding_frog": "Legendary",
//         "stress_test": true
//     },
//     "tier_points": 36220.70455037119,
//     "total_bonus_points": 17139.95030436247,
//     "total_points": 57822.140893200114,
//     "tvl_usd": 38.11547205762135,
//     "twitter_connected": true
// }