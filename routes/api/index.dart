import 'package:dart_frog/dart_frog.dart';

// Response onRequest(RequestContext context) {
//   return Response(body: 'Welcome to Dart Frog!');
// }

Response onRequest(RequestContext context) {
  final method = context.request.method.value;
  final header = context.request.headers;
  return Response.json(body: header);
}
