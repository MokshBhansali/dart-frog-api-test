import 'package:dio/dio.dart';

class DataService {
  final dios = Dio();

  Future<List<dynamic>> getAllTodos() async {
    final result =
        await dios.get('https://jsonplaceholder.typicode.com/posts/');
    final list = result.data as List<dynamic>;
    final filteredData = list
        .map(
          (e) => {'title': e['title'], 'body': e['body']},
        )
        .toList();
    return filteredData;
  }

  Future<dynamic> getPostsByID(int id) async {
    final result =
        await dios.get('https://jsonplaceholder.typicode.com/posts/$id');
    // final list = result.data as List<dynamic>;
    // final filteredData = list
    //     .map(
    //       (e) => {'title': e['title'], 'body': e['body']},
    //     )
    //     .toList();
    return result.data;
  }
}
