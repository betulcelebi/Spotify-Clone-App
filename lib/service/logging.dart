import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class Logging extends Interceptor {
  Response? get response => null;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST  ${options.method} => ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "RESPONSE  ${response.statusCode} => ${response.requestOptions.path}");

    switch (response.statusCode) {
      case 200:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        /* showSnackBar(
            builder: (_) =>
                const SnackBar(content: Text('My awesome snackBar!'))); */
        break;
      case 400:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      case 401:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      case 403:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      case 404:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      case 500:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      case 502:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("On Page Load"),
            content: Text("Hello World!"),
          ),
        );
        break;
      default:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("selamun aleyküm"),
            content: Text("aleyküm selam!"),
          ),
        );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}

snackBarr(String title, message, BuildContext context) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      color: Colors.amber,
      title: title,
      message: message,
      contentType: ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
