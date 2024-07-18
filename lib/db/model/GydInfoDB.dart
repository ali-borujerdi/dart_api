import 'package:objectbox/objectbox.dart';

@Entity()
class GydInfoDB {
  @Id()
  int dbId;

  double gydPrice;
  double gydAllVolume;
  double gydEthSupply;
  int timeStamp;

  GydInfoDB(
      {this.dbId = 0,
      required this.gydPrice,
      required this.gydAllVolume,
      required this.gydEthSupply})
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
}
