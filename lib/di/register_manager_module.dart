part of 'di_graph_setup.dart';

void _registerManagersModule() {
  Get.put(ConnectivityManager());
  Get.put(PermissionManager());
}
