import 'package:dio/dio.dart';


class TimeLineService {
  static final _instance = TimeLineService._private();

  TimeLineService._private();

  factory TimeLineService() => _instance;

  Future<Response> getData(Dio dio) async {
    return await dio.get("/products");
  }
}
