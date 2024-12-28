// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:dart_api/Data/Network/api.dart';

class QuickChartApi implements Api<Response> {
  static const path =
      'https://quickchart.io/chart?c={type:\'line\',data:{labels:[\'Q1\',\'Q2\',\'Q3\',\'Q4\'], datasets:[{label:\'Users\',data:[50,60,70,180]},{label:\'Revenue\',data:[100,200,300,400]}]}}';

  static const path2 =
      'https://quickchart.io/chart?chart={type:\'line\',data:{labels:[\'Q1\',\'Q2\',\'Q3\',\'Q4\'], datasets:[{label:\'Users\',data:[50,60,,70]},{label:\'TVL\',data:[100,200,300,400]}]}}&width=500&height=300&format=base64';
  final _dio = Dio();

  final List<String> labels;
  final List<double> data;

  QuickChartApi({
    required this.labels,
    required this.data,
  });

  @override
  Future<Response> get() async {
    var l = '';
    for (var i in labels) {
      l += '\'$i\',';
    }
    l = l.substring(0, l.length - 1);
    var d = '';
    for (var j in data) {
      d += j.toString();
      d += ',';
    }
    d = d.substring(0, d.length - 1);

    var path3 =
        'https://quickchart.io/chart?chart={type:\'line\',data:{labels:[$l], datasets:[{label:\'TVL\',data:[$d]}]},options: { scales: { yAxes: [ { ticks: { autoSkip: true, },},],},},}&width=500&height=300&format=base64';
    return await _dio.get(path3);
  }
}
