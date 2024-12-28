class GydStatusSnapshot {
  double gydPrice;
  double totalTVL;
  double allVolume;
  double gydAllVolume;
  DateTime timeStamp;

  GydStatusSnapshot({
    required this.gydPrice,
    required this.gydAllVolume,
    required this.allVolume,
    required this.totalTVL,
    required this.timeStamp,
  });
}
