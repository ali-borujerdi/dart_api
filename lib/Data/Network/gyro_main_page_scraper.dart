import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';

class GyroMainPageScraper {
  final path = 'https://gyro.finance/';
  final _dio = Dio();

  Future<String> excuteSample() async {
    /// test
    var url = Uri.parse(path);
    var response = await _dio.get(path);
    BeautifulSoup bs = BeautifulSoup(response.data);
    final allHeaderName = bs.findAll('script', attrs: {'id': '__NEXT_DATA__'});
    return allHeaderName.first.text;
  }
}

void main(List<String> args) async {
  var c = GyroMainPageScraper();
  print(await c.excuteSample());
}
