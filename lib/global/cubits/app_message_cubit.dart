import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_flutter/helpers/utils/error_handler.dart';

part '../states/app_message_state.dart';

class AppMessageCubit extends Cubit<AppMessageState> {
  // Статические методы для прослушивания и получения кубита
  static AppMessageState watchState(BuildContext context) => context.watch<AppMessageCubit>().state;
  static AppMessageCubit read(BuildContext context) => context.read<AppMessageCubit>();

  AppMessageCubit({required this.errorHandler}) : super(AppMessageState(message: '', messageType: MessageType.none));

  final ErrorHandler errorHandler;

  void refreshApp() {
    emit(AppMessageState(message: '', messageType: MessageType.none));
  }

  void showDioErrorMessage(DioError e) {
    final String error = errorHandler.handle(e);
    if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout) {
      emit(AppMessageState(message: 'Истекло время соединения, пороверьте соединение с интернетом.', messageType: MessageType.networkException));
    } else if (e.response?.statusCode == 403) {
      emit(AppMessageState(message: 'Истек срок авторизации', messageType: MessageType.deauthorise, durationInSeconds: 10));
    } else {
      if (e.error is SocketException) {
        log('🌍🌍 Ошибка на contract_details_cubit: $error');
        emit(AppMessageState(message: error, messageType: MessageType.networkException));
      } else {
        log('🔥🔥 Ошибка на contract_details_cubit: $error');
        emit(AppMessageState(message: error, messageType: MessageType.error));
      }
    }
  }

  void showErrorMessage(String message) {
    emit(AppMessageState(message: message, messageType: MessageType.error));
  }

  void showInformationMessage(String message) {
    emit(AppMessageState(message: message, messageType: MessageType.info));
  }
}
