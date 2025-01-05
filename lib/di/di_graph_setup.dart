import 'dart:io';

import 'package:callmobile/core/repository/call_repository.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:callmobile/core/managers/connectivity_manager.dart';

import 'package:callmobile/core/managers/permission_manager.dart';

import 'package:callmobile/core/repository/auth_repository.dart';
import 'package:callmobile/utils/app_api_config.dart';
import 'package:callmobile/utils/app_shared.dart';

import '../core/api/api_client.dart';
import '../core/repository/interface/i_auth_repository.dart';

import '../utils/auth_interceptor.dart';

part 'environment_module.dart';
part 'register_core_module.dart';
part 'register_manager_module.dart';

Future<void> setupDependenciesGraph() async {
  // load all global settings
  await _initializeEnvironment();

  // Core Dependencies
  await _registerCoreModule();

  // Managers Dependencies
  _registerManagersModule();
}
