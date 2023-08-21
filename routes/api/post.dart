import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:my_project/data_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final dataService = DataService();

  final uri = context.request.uri;

  if (uri.hasQuery) {
    final id = uri.queryParameters['id'];

    if (int.tryParse(id!) != null) {
      final singleData = await dataService.getPostsByID(int.parse(id));

      return Response.json(body: singleData);
    } else {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'message': 'ID is not a valid integer',
          'statusCode': HttpStatus.badRequest,
        },
      );
    }
  } else {
    final allData = await dataService.getAllTodos();
    // final paramas = context.request.uri.queryParameters;
    return Response.json(body: allData);
  }
}
