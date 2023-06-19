import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandler {
  String handle(e) {
    switch (e?.runtimeType) {
      case SocketException:
        throw Exception('Issue with network connection');
      case DioError:
        final dioError = e as DioError;
        if (dioError.error is SocketException) {
          throw Exception('Issue with network connection');
        }
        final response = dioError.response;

        String backMessage = 'Неизвестная ошибка';
        final data = response?.data;
        if (data != null && data is Map) {
          if (data.containsKey("errors") && data['errors'] is List) {
            final list = data['errors'] as List;
            backMessage = list.first.first;
          }
        }

        log('⛔️----------------------------⬇️⬇️⬇️-----------------------------⛔️');
        log('NETWORK ERROR WITH STATUS ${response?.statusCode}: $backMessage');
        log('\n');
        log('🔴 REQUEST TO: ${response?.realUri}\n');
        log('🟢 PARAMETERS: ${response?.requestOptions.data}');
        log('🟣 HEADERS: ${response?.headers}');
        log('⛔️----------------------------⬆️⬆️⬆️-----------------------------⛔️');

        return backMessage;

      default:
        return 'Неизвестная ошибка';
    }
  }
}
