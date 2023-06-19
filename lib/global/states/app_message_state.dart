part of '../cubits/app_message_cubit.dart';

enum MessageType { info, error, networkException, deauthorise, none }

class AppMessageState {
  final MessageType messageType;
  final String message;
  final int durationInSeconds;

  AppMessageState({
    required this.message,
    required this.messageType,
    this.durationInSeconds = 5,
  });
}
