import 'dart:io';

class CustomHttpClient implements HttpClient {
  CustomHttpClient(SecurityContext? c);

  @override
  dynamic noSuchMethod(Invocation invocation) {

  }
}

class PostHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
        ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
}