import 'dart:io';

import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/routing/waiting_router.dart';
import 'package:flutter/cupertino.dart' hide CupertinoTabScaffold, CupertinoTabBar;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/managers/signaling.dart';
import '../../../core/model/enum/enum_bottom_navigation_page.dart';
import '../../../core/model/enum/enum_setting.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_shared.dart';
import '../../../utils/app_styles.dart';
import '../../routing/creator_home_router.dart';
import '../../routing/setting_router.dart';
import '../../widgets/app_tab_bar.dart';
import '../../widgets/app_tab_scaffold.dart';
import 'interactor/main_creator_bloc.dart';

RTCVideoRenderer localRenderer = RTCVideoRenderer();
RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

class MainCreatorPage extends StatefulWidget {
  final BottomNavigationPage currentPage;
  final SettingType? settingTab;
  const MainCreatorPage({
    super.key,
    this.currentPage = BottomNavigationPage.home,
    this.settingTab,
  });

  @override
  State<MainCreatorPage> createState() => _MainCreatorPageState();
}

class _MainCreatorPageState extends State<MainCreatorPage> with WidgetsBindingObserver {
  bool isConnect = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<MainCreatorBloc>()
        ..add(OnGetUserDetail(onGetUserSuccess: (user) async {
          final bloc = Get.find<MainCreatorBloc>();
          // Handle open specific page after logged in
          if (widget.settingTab != null) {
            bloc.add(const OnChangeTabEvent(BottomNavigationPage.setting));
            await Future.delayed(const Duration(milliseconds: 200));
          }
        })),
      child: BlocConsumer<MainCreatorBloc, MainCreatorState>(
        listenWhen: (p, c) => p.currentPage != c.currentPage,
        listener: (context, state) {
          context.read<MainCreatorBloc>().tabController.index = creatorPages.indexOf(state.currentPage);
        },
        builder: (context, state) {
          final bloc = context.read<MainCreatorBloc>();
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: CupertinoTabScaffold(
                  backgroundColor: Colors.white,
                  controller: bloc.tabController,
                  tabBar: CupertinoTabBar(
                      border: null,
                      backgroundColor: Colors.white,
                      items: [
                        _buildButtonBar(BottomNavigationPage.home, state),
                        _buildButtonBar(BottomNavigationPage.waiting, state),
                        _buildButtonBar(BottomNavigationPage.setting, state),
                      ],
                      onTap: (index) {
                        bloc.add(OnChangeTabEvent(creatorPages[index]));
                      }),
                  tabBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: CreatorHomeRoutes.onGenerateRoute);
                      case 1:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: WaitingRoutes.onGenerateRoute);
                      case 2:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: SettingRoutes.onGenerateRoute);
                      default:
                        return const CupertinoTabView();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildButtonBar(BottomNavigationPage page, MainCreatorState state,) {
    return BottomNavigationBarItem(
      icon: LayoutBuilder(
        builder: (context, constraints) {
          final leftPosition = (constraints.maxWidth/2) - 16 - 8;
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Stack(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      page.activeIcon,
                      height: 22,
                      width: 22,
                    ),
                    8.height,
                    Text(
                      page.nameTab,
                      style: AppStyles.fontSize12(color: AppColors.black),
                    )
                  ],
                ),
                if(page == BottomNavigationPage.waiting && state.waitingCount != null)
                  Positioned(
                    top: 7,
                    right: leftPosition,
                    child: Visibility(
                      visible: true,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: AppColors.colorFF393F,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text('${state.waitingCount ?? ''}', style: AppStyles.fontSize8(color: AppColors.white, fontWeight: FontWeight.w600),)),
                      ),
                    ),
                  )
              ],
            ),
          );
        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initAndListenCall();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _checkCalling();
    });
  }

  Future<void> initAndListenCall() async {
    await initRenderer();
    listenStreamVideo();
  }

  Future<void> initRenderer() async {
    await remoteRenderer.initialize();
    await localRenderer.initialize();
  }

  void listenStreamVideo() {
    final signaling = Get.put(Signaling());
    signaling.connect();

    signaling.onSignalingStateChange = ((state) {
      if (state == SignalingState.connectionOpen) isConnect = true;
      _checkCalling();
    });

    signaling.onLocalStream = ((stream) {
      debugPrint("Signaling onLocalStream mainCreatorPage");
      localRenderer.srcObject = stream;
    });

    signaling.onAddRemoteStream = ((_, stream) {
      debugPrint("Signaling onAddRemoteStream mainCreatorPage");
      remoteRenderer.srcObject = stream;
    });

    signaling.onRemoveRemoteStream = ((_, stream) {
      remoteRenderer.srcObject = null;
    });
  }

  @override
  void dispose() {
    Get.delete<MainCreatorBloc>();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        final signaling = Get.find<Signaling>();
        signaling.isBackground = false;
        break;
      case AppLifecycleState.inactive:
        final signaling = Get.find<Signaling>();
        signaling.isBackground = true;
        break;
      case AppLifecycleState.paused:
        final signaling = Get.find<Signaling>();
        signaling.isBackground = true;
        break;
      case AppLifecycleState.detached:
        debugPrint("app in detached");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

  void _checkCalling({bool? incoming, Map? off}) async {
    if (!isConnect) return;
    if (Platform.isAndroid) {
      // final appShared = Get.find<AppShared>();
      final Box box = await Hive.openBox(AppShared.keyBox);

      try {
        final isIncomingCall = incoming ?? box.get('hasIncomingCall') ?? false;
        debugPrint("Signaling isIncomingCall $isIncomingCall");

        if (isIncomingCall) {
          final offer = off ?? box.get('offer') ?? {};

          debugPrint("Signaling offer $offer");
          var peerId = offer['from'];
          var description = offer['description'];
          var media = offer['media'];
          var sessionId = offer['session_id'];

          final signaling = Get.find<Signaling>();

          signaling.processOffer(
              peerId: peerId, description: description, media: media, sessionId: sessionId);

          box.put('hasIncomingCall', false);
          box.delete('channelId');
        }
      } catch (ex) {
        box.put('hasIncomingCall', false);
      }
    }
  }
}
