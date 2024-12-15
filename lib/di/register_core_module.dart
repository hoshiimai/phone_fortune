part of 'di_graph_setup.dart';

Future<void> _registerCoreModule() async {
  // await Firebase.initializeApp();

  // Hive (Key, value)
  await Get.putAsync<AppShared>(() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    // ..registerAdapter(UserAdapter());
    final Box box = await Hive.openBox(AppShared.keyBox);
    return AppShared(box);
  });

  // Dio
  await Get.putAsync<Dio>(() async {
    final dio = Dio()
      ..options.baseUrl = AppApiConfig.baseApiUrl
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..interceptors.add(AuthInterceptor());

    // if (AppApiConfig.flavor == Flavor.dev && kDebugMode) {
    // dio.interceptors.add(Get.find<Alice>().getDioInterceptor());
    // }

    return dio;
  }, permanent: true);

  // Api Client
  await Get.putAsync<ApiClient>(() async {
    return ApiClient(Get.find<Dio>(), baseUrl: AppApiConfig.baseApiUrl);
  }, permanent: true);

  // Api Client
  await Get.putAsync<IAuthRepository>(() async {
    return AuthRepository(Get.find<ApiClient>());
  }, permanent: true);
}
