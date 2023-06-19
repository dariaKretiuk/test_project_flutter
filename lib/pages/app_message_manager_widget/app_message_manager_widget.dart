import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project_flutter/global/cubits/app_message_cubit.dart';

import 'Info_toast.dart';
import 'error_toast.dart';

class AppMessageManagerWidget extends StatefulWidget {
  const AppMessageManagerWidget({super.key, required this.child});

  final Widget child;

  @override
  State<AppMessageManagerWidget> createState() => _AppMessageManagerWidgetState();
}

class _AppMessageManagerWidgetState extends State<AppMessageManagerWidget> {
  late FToast toast;

  @override
  void initState() {
    toast = FToast();
    toast.init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppMessageCubit, AppMessageState>(
      listener: (context, state) {
        log(state.message);
        toast.removeQueuedCustomToasts();
        if (state.messageType != MessageType.networkException &&
            state.messageType != MessageType.none &&
            state.messageType != MessageType.deauthorise &&
            state.message != '') {
          toast.showToast(
            gravity: ToastGravity.BOTTOM,
            child: state.messageType == MessageType.error
                ? ErrorToast(
                    errorMessage: state.message,
                  )
                : InfoToast(
                    message: state.message,
                  ),
            toastDuration: Duration(seconds: state.durationInSeconds),
          );
        } else if (state.messageType == MessageType.deauthorise) {
          toast.showToast(
            gravity: ToastGravity.BOTTOM,
            child: ErrorToast(
              errorMessage: state.message,
            ),
            toastDuration: Duration(seconds: state.durationInSeconds),
          );
        }
      },
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
          child: widget.child,
        );
      },
    );
  }
}
