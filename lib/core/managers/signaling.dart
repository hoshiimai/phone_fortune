// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:get/get.dart' as get_x;
// import 'package:callmobile/core/managers/call_manager.dart';
// import 'package:callmobile/core/model/business/creator_update.dart';
// import 'package:callmobile/core/model/enum/enum_role.dart';
// import 'package:callmobile/core/model/message.dart';
// import 'package:callmobile/core/model/response/error_from_server.dart';
// import 'package:callmobile/core/model/response/model/room.dart';
// import 'package:callmobile/core/model/response/model/user.dart';
// import 'package:callmobile/core/repository/interface/i_creator_repository.dart';
// import 'package:callmobile/core/repository/interface/i_notification_repository.dart';
// import 'package:callmobile/core/repository/interface/i_room_repository.dart';
// import 'package:callmobile/extensions/string_extensions.dart';
// import 'package:callmobile/locale/locale_key.dart';
//
// import 'package:callmobile/ui/widgets/base/app_bottomsheet.dart';
// import 'package:callmobile/ui/widgets/base/app_dialog.dart';
// import 'package:callmobile/ui/widgets/base/toast/app_toast.dart';
// import 'package:callmobile/utils/app_api_config.dart';
// import 'package:callmobile/utils/app_constants.dart';
// import 'package:callmobile/utils/app_pages.dart';
// import 'package:callmobile/utils/app_shared.dart';
//
// import '../model/business/creator_update_type.dart';
// import '../model/enum/type_call.dart';
//
// enum SignalingState {
//   connectionOpen,
//   connectionClosed,
//   connectionError,
// }
//
// enum CallStateType {
//   callStateNew,
//   callStateConnected,
//   callStateBye,
// }
//
// enum VideoSource {
//   camera,
//   screen,
// }
//
// class Session {
//   Session({required this.sid, required this.pid});
//   String pid;
//   String sid;
//   RTCPeerConnection? pc;
//   RTCDataChannel? dc;
//   List<RTCIceCandidate> remoteCandidates = [];
// }
//
// class Signaling {
//   final JsonEncoder _encoder = const JsonEncoder();
//   final appShared = get_x.Get.find<AppShared>();
//   String? _selfId;
//   String? nickname;
//   User? _selfUser;
//   SocketService? _socket;
//   final Map<String, Session> _sessions = {};
//   MediaStream? _localStream;
//   final List<MediaStream> _remoteStreams = <MediaStream>[];
//   final List<RTCRtpSender> _senders = <RTCRtpSender>[];
//   VideoSource _videoSource = VideoSource.camera;
//   bool isBackground = false;
//
//   Function(SignalingState state)? onSignalingStateChange;
//   Function(Session session, CallStateType state)? onCallStateChange;
//   Function(Message msg)? onMessChange;
//   Function(int amount, bool isTip)? onTipPointChange;
//   Function(MediaStream stream)? onLocalStream;
//   Function(Session session, MediaStream stream)? onAddRemoteStream;
//   Function(Session session, MediaStream stream)? onRemoveRemoteStream;
//   MediaStream? mRemoteStream;
//   Function(dynamic event)? onPeersUpdate;
//
//   bool isReject = false;
//   bool isAuction = false;
//
//   final roomRepository = get_x.Get.find<IRoomRepository>();
//   final creatorRepository = get_x.Get.find<ICreatorRepository>();
//   final notificationRepository = get_x.Get.find<INotificationRepository>();
//
//   String get sdpSemantics => 'unified-plan';
//
//   final Map<String, dynamic> _iceServers = {
//     'iceServers': [
//       {'urls': 'stun:stun.l.google.com:19302'},
//       {'urls': 'stun:stun1.l.google.com:19302'},
//       {'urls': 'stun:stun2.l.google.com:19302'},
//     ]
//   };
//
//   final Map<String, dynamic> _config = {
//     'mandatory': {},
//     'optional': [
//       {'DtlsSrtpKeyAgreement': true},
//     ]
//   };
//
//   Signaling() {
//     appShared.watchUser().listen((user) {
//       if (user != null) {
//         _selfId = user.id.toString();
//         nickname = user.nickname;
//         _selfUser = user;
//       }
//     });
//   }
//
//   int? roomId;
//   void processCall(User creator) async {
//     // CALL API Detail room
//     debugPrint("Signaling user ${creator.id}");
//     final responseCreator = await creatorRepository.detailCreator(creatorId: creator.id);
//
//     responseCreator.fold((error) {
//       debugPrint("creatorRepository $error");
//     }, (userCreator) {
//       final typeCall =
//           TypeCall.getTypeCall(creatorRoomLength: userCreator.creatorRoom?.length ?? 0);
//
//       // print("pointBalance ${_selfUser?.pointBalance}");
//       if (typeCall == TypeCall.available) {
//         if ((_selfUser?.pointBalance ?? 0) >= (userCreator.initialCallFee ?? 0)) {
//           showConfirmDialog(
//             title: LocaleKey.confirm.tr,
//             message: "${LocaleKey.callTo.trParams({
//                   'name': userCreator.nickname ?? userCreator.nameKata ?? ""
//                 })}\n\n${LocaleKey.feeToCall.trParams({
//                   'initCallTime': userCreator.initialCallTiming.toString(),
//                   'afterCallTime': userCreator.afterCallTiming.toString(),
//                   'firstPoint': userCreator.initialCallFee.toString(),
//                   'secondPoint': userCreator.afterCallFee.toString(),
//                 })}\n\n${LocaleKey.areYouSure.tr}",
//             onClickConfirm: () async {
//               final response = await roomRepository.createRoom(
//                 null,
//                 userCreator.id,
//                 0,
//                 '',
//                 userCreator.initialCallFee ?? 0,
//               );
//               response.fold((error) {
//                 get_x.Get.back();
//                 showErrorToast(error.message);
//               }, (room) {
//                 roomId = room.id;
//                 get_x.Get.back();
//                 CallBinding().dependencies();
//                 get_x.Get.toNamed(AppPages.call,
//                     arguments: {'user': userCreator, 'isCaller': true});
//
//                 Future.delayed(const Duration(milliseconds: 2000)).then((value) {
//                   invite(creator.id.toString(), "video", false);
//                 });
//               });
//             },
//           );
//         } else {
//           showErrorToast(LocaleKey.pointNotEnough.tr);
//         }
//       } else if (typeCall == TypeCall.calling) {
//         final room = userCreator.creatorRoom?.firstOrNull != null
//             ? Room.fromJson(userCreator.creatorRoom?.firstOrNull)
//             : null;
//         if (room == null) return;
//
//         final liveAt = room.liveAt.toLocal();
//         final now = DateTime.now();
//         final difference = now.difference(liveAt).inSeconds;
//         final isOverFirstTime = difference > (userCreator.initialCallTiming ?? 0) * 60;
//
//         final firstPt = room.initialCallFeeLatest ?? room.initialCallFee ?? 0;
//         final lastPt = room.afterCallFeeLatest ?? room.afterCallFee ?? 0;
//
//         final amountAuction = isOverFirstTime ? lastPt : firstPt;
//
//         if ((_selfUser?.pointBalance ?? 0) > amountAuction) {
//           showInterruptRequestBottomSheet(
//             initCallTime: userCreator.initialCallTiming ?? 0,
//             firstPoint: firstPt,
//             afterCallTime: userCreator.afterCallTiming ?? 0,
//             secondPoint: lastPt,
//             overTimeFirst: isOverFirstTime,
//             onSubmit: (firstPoint, secondPoint) {
//               if (isOverFirstTime) {
//                 if (secondPoint <= lastPt) {
//                   return;
//                 }
//                 firstPoint = firstPt;
//
//                 if (firstPoint > (_selfUser?.pointBalance ?? 0) ||
//                     lastPt > (_selfUser?.pointBalance ?? 0)) {
//                   get_x.Get.back();
//
//                   showEnoughPoint(onSubmit: () {
//                     get_x.Get.back();
//
//                     get_x.Get.dialog(SubscriptionPage(
//                       onPurchase: () {
//                         get_x.Get.back();
//                         showPurchaseSuccessDialog();
//                       },
//                     ));
//                   }, onCancel: () {
//                     get_x.Get.back();
//                   });
//                   return;
//                 }
//               } else {
//                 if (firstPoint <= firstPt || secondPoint <= lastPt) {
//                   return;
//                 }
//
//                 if (firstPoint > (_selfUser?.pointBalance ?? 0) ||
//                     lastPt > (_selfUser?.pointBalance ?? 0)) {
//                   get_x.Get.back();
//
//                   showEnoughPoint(onSubmit: () {
//                     get_x.Get.back();
//
//                     get_x.Get.dialog(SubscriptionPage(
//                       onPurchase: () {
//                         get_x.Get.back();
//                         showPurchaseSuccessDialog();
//                       },
//                     ));
//                   }, onCancel: () {
//                     get_x.Get.back();
//                   });
//                   return;
//                 }
//               }
//
//               get_x.Get.back();
//
//               _send('streamAuction', {
//                 "fanNewId": _selfUser?.id,
//                 "creatorId": userCreator.id,
//                 "name": nickname,
//                 "isNew": true,
//                 "amount": amountAuction,
//                 "roomID": room.id,
//                 "rootID": room.rootId,
//                 "firstPoint": firstPoint,
//                 "secondPoint": secondPoint,
//                 "initCallTime": userCreator.initialCallTiming ?? 0,
//                 "afterCallTime": userCreator.afterCallTiming ?? 0,
//                 "overTimeFirst": isOverFirstTime,
//                 "show_bottom_creator": true,
//               });
//             },
//             onCancel: () {
//               get_x.Get.back();
//             },
//           );
//         } else {
//           get_x.Get.back();
//
//           showEnoughPoint(onSubmit: () {
//             get_x.Get.back();
//             get_x.Get.toNamed(AppPages.transactionPoint);
//           }, onCancel: () {
//             get_x.Get.back();
//           });
//         }
//       }
//     });
//   }
//
//   Future<bool> switchCamera() async {
//     if (_localStream != null) {
//       if (_videoSource != VideoSource.camera) {
//         for (var sender in _senders) {
//           if (sender.track!.kind == 'video') {
//             sender.replaceTrack(_localStream!.getVideoTracks()[0]);
//           }
//         }
//         _videoSource = VideoSource.camera;
//         onLocalStream?.call(_localStream!);
//       } else {
//         Helper.switchCamera(_localStream!.getVideoTracks()[0]);
//       }
//       return true;
//     }
//     return false;
//   }
//
//   Future<bool> muteMic(bool value) async {
//     if (_localStream != null) {
//       _localStream!.getAudioTracks()[0].enabled = value;
//       return true;
//     }
//     return false;
//   }
//
//   Future<void> setAudioOutput(bool value) async {
//     Helper.setSpeakerphoneOn(value);
//   }
//
//   Future<bool> onOffVideo(bool value) async {
//     if (_localStream != null) {
//       _localStream!.getVideoTracks()[0].enabled = value;
//
//       return true;
//     }
//     return false;
//   }
//
//   void invite(String peerId, String media, bool isAccept) async {
//     var sessionId = '$_selfId-$peerId-$roomId';
//     Session session =
//         await _createSession(null, peerId: peerId, sessionId: sessionId, media: media);
//     _sessions[sessionId] = session;
//
//     _createOffer(session, media, isAccept, peerId);
//
//     onCallStateChange?.call(session, CallStateType.callStateNew);
//   }
//
//   void bye(String sessionId, int timeCall, {required TypeCall status, bool isSendEvent = true}) {
//     if (isSendEvent) {
//       _send(
//         'bye',
//         {
//           'session_id': sessionId,
//           'roomId': roomId ?? '',
//           'status': status.index,
//           'from': _selfId,
//           'time': timeCall,
//         },
//         isMessage: true,
//       );
//     }
//     var sess = _sessions[sessionId];
//     if (sess != null) {
//       _closeSession(sess);
//     }
//   }
//
//   void accept(String sessionId, String media) async {
//     var session = _sessions[sessionId];
//     if (session == null) {
//       return;
//     }
//
//     roomId = int.tryParse(sessionId.split('-')[2]);
//
//     if (roomId == null) return;
//
//     final response = await roomRepository.updateRoom(roomId!, 1);
//     response.fold((error) {
//       showErrorToast(error.message);
//     }, (room) {
//       _createAnswer(session, media);
//     });
//   }
//
//   void reject(String sessionId, int timeCall) {
//     var session = _sessions[sessionId];
//     if (session == null) {
//       return;
//     }
//     bye(session.sid, timeCall, status: TypeCall.cancel);
//   }
//
//   void processOffer({dynamic peerId, dynamic description, dynamic media, dynamic sessionId}) async {
//     roomId = int.tryParse(sessionId.split('-')[2]);
//     debugPrint("Signaling ${sessionId.split('-')} -RoomID: $roomId}");
//
//     CallBinding().dependencies();
//     get_x.Get.toNamed(AppPages.call,
//         arguments: {'user': null, 'isCaller': false, 'inCalling': true, 'isStartTime': true});
//
//     if (Platform.isIOS) {
//       await Future.delayed(const Duration(milliseconds: 1000));
//
//       cleanSessions();
//
//       await disposeAndReInitVideos();
//     }
//
//     var session = _sessions[sessionId];
//
//     var newSession =
//         await _createSession(session, peerId: peerId, sessionId: sessionId, media: media);
//
//     _sessions[sessionId] = newSession;
//
//     await newSession.pc
//         ?.setRemoteDescription(RTCSessionDescription(description['sdp'], description['type']));
//
//     onCallStateChange?.call(newSession, CallStateType.callStateNew);
//
//     if (newSession.remoteCandidates.isNotEmpty) {
//       for (final candidate in newSession.remoteCandidates) {
//         await newSession.pc?.addCandidate(candidate);
//       }
//
//       newSession.remoteCandidates.clear();
//     }
//
//     accept(newSession.sid, 'video');
//   }
//
//   void onMessage(message) async {
//     Map<String, dynamic> mapData = message;
//     var data = mapData['data'];
//
//     switch (mapData['type']) {
//       case 'peers':
//         {
//           List<dynamic> peers = data;
//           if (onPeersUpdate != null) {
//             Map<String, dynamic> event = <String, dynamic>{};
//             event['self'] = _selfId;
//             event['peers'] = peers;
//             onPeersUpdate?.call(event);
//           }
//         }
//         break;
//       case 'offer':
//         {
//           if (isBackground) return;
//
//           isReject = false;
//           var peerId = data['from'];
//           var description = data['description'];
//           var media = data['media'];
//           var sessionId = data['session_id'];
//           var isAccept = data['is_accept'];
//           var session = _sessions[sessionId];
//
//           if (isAccept) {
//             cleanSessions();
//
//             await disposeAndReInitVideos();
//           }
//           var newSession =
//               await _createSession(session, peerId: peerId, sessionId: sessionId, media: media);
//
//           _sessions[sessionId] = newSession;
//           await newSession.pc?.setRemoteDescription(
//               RTCSessionDescription(description['sdp'], description['type']));
//           if (isReject) return;
//
//           if (isAccept) {
//             get_x.Get.back();
//             await _createAnswer(newSession, media);
//             onCallStateChange?.call(newSession, CallStateType.callStateNew);
//           }
//
//           if (newSession.remoteCandidates.isNotEmpty) {
//             for (final candidate in newSession.remoteCandidates) {
//               await newSession.pc?.addCandidate(candidate);
//             }
//
//             newSession.remoteCandidates.clear();
//           }
//
//           if (!isAccept && _selfUser?.role == Role.creator) {
//             roomId = int.tryParse(newSession.sid.split("-")[2]);
//
//             if (get_x.Get.isRegistered<CallBloc>()) {
//               // get_x.Get.back();
//               get_x.Get.delete<CallBloc>();
//             }
//
//             CallBinding().dependencies();
//             get_x.Get.toNamed(AppPages.call, arguments: {'user': null, 'isCaller': false});
//
//             Future.delayed(const Duration(milliseconds: 200)).then((value) {
//               onCallStateChange?.call(newSession, CallStateType.callStateNew);
//             });
//           }
//         }
//         break;
//       case 'answer':
//         {
//           var description = data['description'];
//           var sessionId = data['session_id'];
//           var session = _sessions[sessionId];
//           session?.pc?.setRemoteDescription(
//               RTCSessionDescription(description['sdp'], description['type']));
//           onCallStateChange?.call(session!, CallStateType.callStateConnected);
//         }
//         break;
//       case 'candidate':
//         {
//           var peerId = data['from'];
//           var candidateMap = data['candidate'];
//           var sessionId = data['session_id'];
//           var session = _sessions[sessionId];
//           RTCIceCandidate candidate = RTCIceCandidate(
//               candidateMap['candidate'], candidateMap['sdpMid'], candidateMap['sdpMLineIndex']);
//
//           if (session != null) {
//             if (session.pc != null) {
//               await session.pc?.addCandidate(candidate);
//             } else {
//               session.remoteCandidates.add(candidate);
//             }
//           } else {
//             _sessions[sessionId] = Session(pid: peerId, sid: sessionId)
//               ..remoteCandidates.add(candidate);
//           }
//         }
//         break;
//
//       case 'bye':
//         {
//           isReject = true;
//           var sessionId = data['session_id'];
//           debugPrint('bye: $sessionId');
//           var session = _sessions.remove(sessionId);
//           if (session != null) {
//             onCallStateChange?.call(session, CallStateType.callStateBye);
//
//             _closeSession(session);
//           }
//         }
//         break;
//       case 'keepalive':
//         {
//           debugPrint('keepalive response!');
//         }
//         break;
//       case 'error':
//       // var reason = data['reason'];
//       // if (reason != null) {
//       //   // get_x.Get.back();
//       //   // bye();
//       //   showErrorToast(reason);
//       // }
//       default:
//         break;
//     }
//   }
//
//   Future disposeAndReInitVideos() async {
//     localRenderer.dispose();
//     remoteRenderer.dispose();
//     localRenderer = RTCVideoRenderer();
//     remoteRenderer = RTCVideoRenderer();
//
//     onLocalStream = ((stream) {
//       debugPrint("Signaling onLocalStream");
//       localRenderer.srcObject = stream;
//     });
//
//     onAddRemoteStream = ((_, stream) {
//       debugPrint("Signaling onAddRemoteStream");
//       remoteRenderer.srcObject = stream;
//     });
//
//     onRemoveRemoteStream = ((_, stream) {
//       remoteRenderer.srcObject = null;
//     });
//
//     await localRenderer.initialize();
//     await remoteRenderer.initialize();
//   }
//
//   Future<void> connect() async {
//     _socket = SocketService(AppConstants.apiProdUrl);
//
//     _socket?.onOpen = () async {
//       onSignalingStateChange?.call(SignalingState.connectionOpen);
//
//       final appShared = get_x.Get.find<AppShared>();
//
//       final token = appShared.getAccessTokenValue();
//       _socket?.send('authenticate', _encoder.convert({'token': token}));
//     };
//
//     _socket?.onMessage = (message) {
//       debugPrint('Received data: $message');
//       onMessage(message);
//     };
//
//     _socket?.statusStream = (data) {
//       if (data == null) {
//         return;
//       }
//
//       if (_selfUser?.role == Role.fan || _selfUser?.role == Role.agency) {
//         var creator = User.fromJson(data);
//         final listFanLiked = data['list_fan_like'];
//         if ((listFanLiked is List) && listFanLiked.contains(_selfUser?.id)) {
//           creator = creator.copyWith(
//             likedCreator: [LikedCreator(id: DateTime.now().millisecondsSinceEpoch)],
//           );
//         }
//         if (get_x.Get.isRegistered<MainBloc>()) {
//           get_x.Get.find<MainBloc>().add(OnUpdateCreator(
//               CreatorUpdate(updateType: CreatorUpdateType.calling, creator: creator)));
//         }
//       }
//     };
//
//     _socket?.statusCreator = (data) {
//       if (data == null) {
//         return;
//       }
//
//       if (_selfUser?.role == Role.fan || _selfUser?.role == Role.agency) {
//         var creator = User.fromJson(data);
//         final listFanLiked = data['list_fan_like'];
//         final listAgent = data['list_agent'];
//         if ((listFanLiked is List) && listFanLiked.contains(_selfUser?.id)) {
//           creator = creator
//               .copyWith(likedCreator: [LikedCreator(id: DateTime.now().millisecondsSinceEpoch)]);
//         }
//         //Update if creator is managed by this agent
//         if (_selfUser?.role == Role.agency &&
//             (listAgent is List) &&
//             listAgent.contains(_selfUser?.id)) {
//           creator = creator.copyWith(isManagedByThisAgent: true);
//         }
//         get_x.Get.find<MainBloc>().add(
//             OnUpdateCreator(CreatorUpdate(updateType: CreatorUpdateType.online, creator: creator)));
//       }
//     };
//
//     _socket?.streamAuction = (data) async {
//       Map<String, dynamic> mapData = data;
//
//       int? fanNewId = mapData['fanNewId'];
//       int? creatorId = mapData['creatorId'];
//       String? name = mapData['name'];
//       bool? isNew = mapData['isNew'];
//       int? amount = mapData['amount'];
//       int? roomID = mapData['roomID'];
//       int? rootID = mapData['rootID'];
//       bool? reject = mapData['reject'];
//       bool? showBottomSheetCreator = mapData['show_bottom_creator'];
//
//       int firstPoint = mapData['firstPoint'] ?? 0;
//       int secondPoint = mapData['secondPoint'] ?? 0;
//       int initCallTime = mapData['initCallTime'] ?? 0;
//       int afterCallTime = mapData['afterCallTime'] ?? 0;
//       bool overTimeFirst = mapData['overTimeFirst'] ?? false;
//
//       bool? hasError = mapData['hasError'];
//       String? message = mapData['message'];
//
//       int callTiming = mapData['call_timing'] ?? 0;
//
//       if (fanNewId != null) {
//         if (fanNewId == _selfUser?.id) {
//           if ((reject ?? false)) {
//             // Auction Success
//             final responseCreator = await creatorRepository.detailCreator(creatorId: creatorId!);
//             responseCreator.fold((error) {
//               debugPrint("creatorRepository $error");
//             }, (userCreator) async {
//               final response = await roomRepository.createRoom(
//                 rootID ?? roomID,
//                 creatorId,
//                 1,
//                 '',
//                 amount ?? 0,
//                 initialCallFeeLatest: firstPoint,
//                 afterCallFeeLatest: secondPoint,
//               );
//               response.fold((error) {
//                 print(error);
//               }, (room) async {
//                 roomId = room.id;
//                 Room roomClone = Room(
//                   id: Random().nextInt(100),
//                   rootId: rootID,
//                   userId: _selfUser!.id,
//                   creatorId: creatorId,
//                   status: TypeCall.calling,
//                   liveAt: DateTime.now(),
//                   callTiming: null,
//                   callFee: null,
//                   totalTipAmount: null,
//                   callFeeCreator: null,
//                   createdAt: DateTime.now(),
//                   totalTipAmountCreator: null,
//                   updatedAt: DateTime.now(),
//                   initialCallFee: firstPoint,
//                   initialCallFeeLatest: firstPoint,
//                   afterCallFeeLatest: secondPoint,
//                   afterCallFee: secondPoint,
//                 );
//                 final userCreatorClone = userCreator.copyWith(
//                     creatorRoom: [roomClone].map((room) => room.toJson()).toList());
//                 CallBinding().dependencies();
//                 get_x.Get.toNamed(AppPages.call, arguments: {
//                   'user': userCreatorClone,
//                   'isCaller': true,
//                   'inCalling': true,
//                   "callTiming": callTiming
//                 });
//
//                 await Future.delayed(const Duration(seconds: 1));
//                 invite(creatorId.toString(), 'video', true);
//               });
//             });
//           } else {
//             // Auction failed
//             get_x.Get.toNamed(AppPages.missingCall, arguments: {'type': MissingType.connect});
//           }
//         } else {
//           if (get_x.Get.isRegistered<CallBloc>()) {
//             if (_selfUser?.role == Role.fan || _selfUser?.role == Role.agency) {
//               get_x.Get.find<CallBloc>().add(OnAuctionFan(
//                 fanNewId: fanNewId,
//                 creatorId: creatorId!,
//                 name: name!,
//                 isNew: isNew!,
//                 amount: amount!,
//                 roomID: roomID!,
//                 rootID: rootID,
//                 firstPoint: firstPoint,
//                 secondPoint: secondPoint,
//                 initCallTime: initCallTime,
//                 afterCallTime: afterCallTime,
//                 overTimeFirst: overTimeFirst,
//               ));
//             } else {
//               if (showBottomSheetCreator ?? false) {
//                 get_x.Get.find<CallBloc>().add(OnAuctionCreator(
//                   fanNewId: fanNewId,
//                   creatorId: creatorId!,
//                   name: name!,
//                   isNew: isNew!,
//                   amount: amount!,
//                   roomID: roomID!,
//                   firstPoint: firstPoint,
//                   secondPoint: secondPoint,
//                   initCallTime: initCallTime,
//                   afterCallTime: afterCallTime,
//                   overTimeFirst: overTimeFirst,
//                 ));
//               } else {
//                 if (!(reject ?? false)) {
//                   get_x.Get.back();
//                 }
//               }
//             }
//           }
//         }
//       } else {
//         if (hasError ?? false) {
//           if (!message.isNullOrEmpty()) showErrorToast(message);
//         }
//       }
//     };
//
//     _socket?.sendChatToPeer = (data) async {
//       Map<String, dynamic> mapData = data;
//
//       Message message =
//           Message(peerId: mapData['peerId'], message: mapData['message'], time: mapData['time']);
//       onMessChange?.call(message);
//     };
//
//     _socket?.donatePoint = (data) async {
//       Map<String, dynamic> mapData = data;
//
//       onTipPointChange?.call(mapData['amount'], mapData['isTip'] ?? false);
//     };
//
//     _socket?.onClose = (int? code, String? reason) {
//       debugPrint('Closed by server [$code => $reason]!');
//       onSignalingStateChange?.call(SignalingState.connectionClosed);
//     };
//
//     await _socket?.connect();
//   }
//
//   Future<MediaStream> createStream(String media) async {
//     final Map<String, dynamic> mediaConstraints = {
//       'audio': true,
//       'video': {
//         'mandatory': {
//           'minWidth': '640', // Provide your own width, height and frame rate here
//           'minHeight': '480',
//           'minFrameRate': '30',
//         },
//         'facingMode': 'user',
//         'optional': [],
//       }
//     };
//     MediaStream stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
//
//     if (onLocalStream != null) {
//       onLocalStream!.call(stream);
//     }
//
//     debugPrint('Local Stream: ${stream.getTracks()}');
//     return stream;
//   }
//
//   Future<Session> _createSession(
//     Session? session, {
//     required String peerId,
//     required String sessionId,
//     required String media,
//   }) async {
//     var newSession = session ?? Session(sid: sessionId, pid: peerId);
//     _localStream = await createStream(media);
//
//     RTCPeerConnection pc = await createPeerConnection({
//       ..._iceServers,
//       ...{'sdpSemantics': sdpSemantics}
//     }, _config);
//     switch (sdpSemantics) {
//       case 'plan-b':
//         pc.onAddStream = (MediaStream stream) {
//           onAddRemoteStream?.call(newSession, stream);
//           _remoteStreams.add(stream);
//         };
//         await pc.addStream(_localStream!);
//         break;
//       case 'unified-plan':
//         // Unified-Plan
//         pc.onTrack = (event) {
//           if (event.track.kind == 'video') {
//             onAddRemoteStream?.call(newSession, event.streams[0]);
//             mRemoteStream = event.streams[0];
//           }
//         };
//         _localStream!.getTracks().forEach((track) async {
//           _senders.add(await pc.addTrack(track, _localStream!));
//         });
//         break;
//     }
//
//     pc.onIceCandidate = (candidate) async {
//       if (candidate.candidate == null) {
//         debugPrint('onIceCandidate: complete!');
//         return;
//       }
//       // This delay is needed to allow enough time to try an ICE candidate
//       // before skipping to the next one. 1 second is just an heuristic value
//       // and should be thoroughly tested in your own environment.
//       await Future.delayed(
//           const Duration(seconds: 1),
//           () => _send(
//                 'candidate',
//                 {
//                   'to': peerId,
//                   'from': _selfId,
//                   'candidate': {
//                     'sdpMLineIndex': candidate.sdpMLineIndex,
//                     'sdpMid': candidate.sdpMid,
//                     'candidate': candidate.candidate,
//                   },
//                   'session_id': sessionId,
//                 },
//                 isMessage: true,
//               ));
//     };
//
//     pc.onIceConnectionState = (state) {
//       debugPrint('ICE Connection State: $state');
//     };
//
//     pc.onRemoveStream = (stream) {
//       onRemoveRemoteStream?.call(newSession, stream);
//       _remoteStreams.removeWhere((it) {
//         return (it.id == stream.id);
//       });
//     };
//
//     newSession.pc = pc;
//     return newSession;
//   }
//
//   Future<void> _createOffer(Session session, String media, bool isAccept, String peerId) async {
//     try {
//       RTCSessionDescription s = await session.pc!.createOffer({});
//
//       await session.pc!.setLocalDescription(_fixSdp(s));
//       _send(
//         'offer',
//         {
//           'to': session.pid,
//           'from': _selfId,
//           'description': {'sdp': s.sdp, 'type': s.type},
//           'session_id': session.sid,
//           'media': media,
//           'is_accept': isAccept,
//         },
//         isMessage: true,
//       );
//
//       if (!isAccept) {
//         notificationRepository.putNotificationCall(
//           creatorId: int.parse(peerId),
//           nameFan: nickname ?? _selfUser?.nameKata ?? "",
//           roomId: roomId,
//           offer: {
//             'to': session.pid,
//             'from': _selfId,
//             'description': {'sdp': s.sdp, 'type': s.type},
//             'session_id': session.sid,
//             'media': media,
//             'is_accept': isAccept,
//             'avatar': _selfUser?.avatar ??
//                 "${AppApiConfig.baseApiUrl}/public/uploads/default/avatar_default.png"
//           },
//         );
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   RTCSessionDescription _fixSdp(RTCSessionDescription s) {
//     var sdp = s.sdp;
//     s.sdp = sdp!.replaceAll('profile-level-id=640c1f', 'profile-level-id=42e032');
//     return s;
//   }
//
//   Future<void> _createAnswer(Session session, String media) async {
//     try {
//       RTCSessionDescription s = await session.pc!.createAnswer({});
//       await session.pc!.setLocalDescription(_fixSdp(s));
//       _send(
//         'answer',
//         {
//           'to': session.pid,
//           'from': _selfId,
//           'description': {'sdp': s.sdp, 'type': s.type},
//           'session_id': session.sid,
//         },
//         isMessage: true,
//       );
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   _send(event, data, {bool isMessage = false}) {
//     var request = {};
//     if (isMessage) request["type"] = event;
//     request["data"] = data;
//     _socket?.send(isMessage ? 'message' : event,
//         isMessage ? _encoder.convert(request) : _encoder.convert(data));
//   }
//
//   Future<void> cleanSessions() async {
//     if (_localStream != null) {
//       _localStream!.getTracks().forEach((element) async {
//         await element.stop();
//       });
//       await _localStream!.dispose();
//       _localStream = null;
//     }
//     _sessions.forEach((key, sess) async {
//       await sess.pc?.close();
//       await sess.dc?.close();
//     });
//     _sessions.clear();
//   }
//
//   Future<void> _closeSession(Session session) async {
//     _localStream?.getTracks().forEach((element) async {
//       await element.stop();
//     });
//     await _localStream?.dispose();
//     _localStream = null;
//
//     await session.pc?.close();
//     await session.dc?.close();
//     _senders.clear();
//     _videoSource = VideoSource.camera;
//   }
//
//   Future<dynamic> sendMessage(String sessionId, String message) async {
//     var session = _sessions[sessionId];
//     if (session == null) {
//       return;
//     }
//
//     int? fanId = int.tryParse(sessionId.split('-')[0]);
//     int? creatorId = int.tryParse(sessionId.split('-')[1]);
//     int? peerId;
//     int? sendId;
//     if (int.tryParse(_selfId ?? "") == fanId) {
//       peerId = creatorId;
//       sendId = fanId;
//     } else {
//       peerId = fanId;
//       sendId = creatorId;
//     }
//     if (roomId == null) return;
//
//     final data = {
//       'peerId': peerId,
//       'sendId': sendId,
//       'roomId': roomId,
//       'message': message,
//       'time': DateTime.now().millisecondsSinceEpoch,
//     };
//
//     _send('sendChatToPeer', data);
//
//     return data;
//   }
//
//   close() async {
//     await cleanSessions();
//     _socket?.close();
//   }
//
//   void sendResponseAuction(
//     int amount,
//     int creatorId,
//     int fanNewId,
//     int roomId,
//     int firstPoint,
//     int secondPoint,
//     int initCallTime,
//     int afterCallTime,
//     bool overTimeFirst,
//   ) {
//     _send('streamAuction', {
//       "fanNewId": fanNewId,
//       "creatorId": creatorId,
//       "name": nickname,
//       "isNew": false,
//       "amount": amount,
//       "roomID": roomId,
//       "reject": false,
//       "firstPoint": firstPoint,
//       "secondPoint": secondPoint,
//       "initCallTime": initCallTime,
//       "afterCallTime": afterCallTime,
//       "overTimeFirst": overTimeFirst,
//       "show_bottom_creator": false
//     });
//   }
//
//   void sendRejectAuction(
//     int amount,
//     int creatorId,
//     int fanNewId,
//     int roomId,
//     int? rootID,
//     int firstPoint,
//     int secondPoint,
//     int initCallTime,
//     int afterCallTime,
//     bool overTimeFirst,
//     int callTiming,
//   ) {
//     _send('streamAuction', {
//       "fanNewId": fanNewId,
//       "creatorId": creatorId,
//       "name": nickname,
//       "isNew": false,
//       "amount": amount,
//       "roomID": roomId,
//       "rootID": rootID,
//       "reject": true,
//       "firstPoint": firstPoint,
//       "secondPoint": secondPoint,
//       "initCallTime": initCallTime,
//       "afterCallTime": afterCallTime,
//       "overTimeFirst": overTimeFirst,
//       "show_bottom_creator": false,
//       "call_timing": callTiming,
//     });
//   }
//
//   Future<dynamic> tipPoint(int roomId, int userId, int amount, int callTiming, bool isTip) async {
//     return await roomRepository.tipPoint(roomId, userId, amount, callTiming, isTip);
//   }
//
//   Future<Either<ErrorFromServer, dynamic>> updateRoom({
//     required int roomId,
//     required int status,
//     int? callTiming,
//     int? callFee,
//     int? amount,
//     int? initialCallFee,
//     int? afterCallFee,
//     int? initialCallFeeLatest,
//     int? afterCallFeeLatest,
//   }) async {
//     return await roomRepository.updateRoom(roomId, status,
//         callTiming: callTiming,
//         callFee: callFee,
//         amount: amount,
//         initialCallFee: initialCallFee,
//         afterCallFee: afterCallFee,
//         initialCallFeeLatest: initialCallFeeLatest,
//         afterCallFeeLatest: afterCallFeeLatest);
//   }
//
//   Future<Either<ErrorFromServer, Room>> getRoomDetail({int? id}) async {
//     return await roomRepository.getRoomDetail(id ?? roomId!);
//   }
//
//   Future<Either<ErrorFromServer, dynamic>> submitRating(int creatorId, int rate) async {
//     return await roomRepository.submitRating(roomId!, creatorId, rate);
//   }
//
//   void pingSocket(String sessionId) {
//     var session = _sessions[sessionId];
//     if (session == null) {
//       return;
//     }
//
//     int? fanId = int.tryParse(sessionId.split('-')[0]);
//     int? creatorId = int.tryParse(sessionId.split('-')[1]);
//     int? userId;
//
//     if (int.tryParse(_selfId ?? "") == fanId) {
//       userId = creatorId;
//     } else {
//       userId = fanId;
//     }
//
//     final data = {
//       'userId': userId,
//     };
//
//     _send('pingToUser', data);
//   }
// }
