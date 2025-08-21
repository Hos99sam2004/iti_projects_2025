import 'package:dio/dio.dart';
import 'package:iti_projects/myapps/news/model.dart';

class Api {
  Model model = Model();
  String url =
      'https://newsapi.org/v2/everything?q=tesla&from=2025-07-21&sortBy=publishedAt&apiKey=3364e8a9dba0443c83c37fd8cb523dde';
  // singleton dio
  // List newslist = [];
  final Dio dio = Dio();
  GetData() async {
    final response = await dio.get(url);

    model = Model.fromJson(response.data);
    print(model.status);
    if (model.status != null) {
      print(model.status);
      print('success');
    }
  }
}
