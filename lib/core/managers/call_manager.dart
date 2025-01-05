import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../ui/widgets/base/toast/app_toast.dart';

class SocketService {
  final String _url;
  io.Socket? _socket;
  Function()? onOpen;
  Function(dynamic msg)? onMessage;
  Function(dynamic data)? donatePoint;
  Function(dynamic data)? sendChatToPeer;
  Function(dynamic data)? statusStream;
  Function(dynamic data)? statusCreator;
  Function(dynamic data)? streamAuction;
  Function(int? code, String? reason)? onClose;
  SocketService(this._url);

  Future<void> connect() async {
    _socket = io.io(_url, <String, dynamic>{
      'transports': ['websocket'],
      'reconnection': true,
      'reconnectionAttempts': 9999,
      'reconnectionDelay': 2000,
    });

    _socket?.on('connect', (_) {
      onOpen?.call();
    });

    _socket?.on("reconnect", (_) {
      onOpen?.call();
    });

    _socket?.on('authResponse', (data) {
      debugPrint("authResponse $data");
    });

    // Listen point donate
    _socket?.on('donatePoint', (data) {
      debugPrint("donatePoint: $data");
      donatePoint?.call(data);
    });

    // Listen message chat
    _socket?.on('sendChatToPeer', (data) {
      debugPrint("sendChatToPeer: $data");
      sendChatToPeer?.call(data);
    });

    // Listen status calling
    _socket?.on('statusStream', (data) {
      debugPrint("statusStream: $data");
      statusStream?.call(data);
    });

    // Listen status creator for fan on/off
    _socket?.on('statusCreator', (data) {
      debugPrint("statusCreator: $data");
      statusCreator?.call(data);
    });

    // Listen Auction
    _socket?.on('streamAuction', (data) {
      debugPrint("streamAuction: $data");
      streamAuction?.call(data);
    });

    _socket?.on('message', (data) {
      onMessage?.call(data);
    });

    _socket?.on('disconnect', (reason) {
      showErrorToast(reason);
      onClose?.call(1000, reason);
    });

    _socket?.on('connect_error', (error) {
      debugPrint("_socket $error");
      if (error is String) {
        showErrorToast(error);
      } else {
        showErrorToast("Socket Connect Error");
      }
      onClose?.call(500, error.toString());
    });

    _socket?.connect();
  }

  send(String? event, data) {
    if (_socket != null) {
      _socket!.emit(event ?? "message", data);
      debugPrint('send: $data');
    }
  }

  close() {
    if (_socket != null) {
      _socket!.clearListeners();
      _socket!.close();
    }
  }
}