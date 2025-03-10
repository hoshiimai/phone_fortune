import 'package:callmobile/ui/common/login/binding/sign_in_binding.dart';
import 'package:callmobile/ui/common/call_summary/binding/binding/call_summary_binding.dart';
import 'package:callmobile/ui/creator/profile/creator_profile_page.dart';
import 'package:get/get.dart';

import '../core/model/argument/call_summary_argument.dart';
import '../core/model/argument/verify_otp_argument.dart';
import '../ui/common/change_password/binding/binding/change_password_binding.dart';
import '../ui/common/change_password/change_password_page.dart';
import '../ui/common/forgot_password/binding/binding/forgot_password_binding.dart';
import '../ui/common/forgot_password/forgot_password_page.dart';
import '../ui/common/login/sign_in_page.dart';
import '../ui/common/pin_code/binding/binding/verify_otp_binding.dart';
import '../ui/common/pin_code/verify_otp_page.dart';
import '../ui/common/register_success/binding/binding/register_success_binding.dart';
import '../ui/common/register_success/register_success_page.dart';
import '../ui/common/sign_up/binding/binding/sign_up_binding.dart';
import '../ui/common/sign_up/sign_up_page.dart';
import '../ui/common/call/call_page.dart';
import '../ui/common/call/missing_page.dart';
import '../ui/common/call_summary/call_summary.dart';
import '../ui/common/splash/binding/splash_binding.dart';
import '../ui/common/splash/splash_page.dart';
import '../ui/creator/main/binding/main_creator_binding.dart';
import '../ui/creator/main/main_creator_page.dart';
import '../ui/creator/profile/binding/binding/creator_profile_binding.dart';
import '../ui/fan/main/binding/main_binding.dart';
import '../ui/fan/main/main_page.dart';

class AppPages {
  static const String splash = _Paths.splash;
  static const String signIn = _Paths.signIn;
  static const String forgotPassword = _Paths.forgotPassword;
  static const String verifyOtp = _Paths.verifyOtp;
  static const String changePassword = _Paths.changePassword;
  static const String registerSuccess = _Paths.registerSuccess;
  static const String signUp = _Paths.signUp;
  static const String main = _Paths.main;
  static const String fanProfile = _Paths.fanProfile;
  static const String fanProfileEdit = _Paths.fanProfileEdit;
  static const String historyChat = _Paths.historyChat;
  static const String settingAccount = _Paths.settingAccount;
  static const String infoView = _Paths.infoView;
  static const String passwordEdit = _Paths.passwordEdit;
  static const String emailEdit = _Paths.emailEdit;
  static const String emailVerify = _Paths.emailVerify;
  static const String creatorProfile = _Paths.creatorProfile;
  static const String creatorProfileEdit = _Paths.creatorProfileEdit;
  static const String call = _Paths.call;
  static const String missingCall = _Paths.missingCall;
  static const String callSummary = _Paths.callSummary;
  static const String mainCreator = _Paths.mainCreator;
  static const String personalInfoEdit = _Paths.personalInfoEdit;

  static final pages = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.verifyOtp,
      page: () => VerifyOtpPage(argument: Get.arguments as VerifyOtpArgument),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.changePassword,
      page: () => ChangePasswordPage(accessToken: Get.arguments['accessToken'] as String),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.registerSuccess,
      page: () => const RegisterSuccessPage(),
      binding: RegisterSuccessBinding(),
    ),
    GetPage(
      name: _Paths.main,
      page: () {
        if (Get.arguments != null) {
          return MainPage(
            currentPage: Get.arguments['bottom_navigation'],
            settingTab: Get.arguments['setting_type'],
          );
        } else {
          return const MainPage();
        }
      },
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.creatorProfile,
      page: () => CreatorProfilePage(creator: Get.arguments != null ? Get.arguments['creator'] : null,),
      binding: CreatorProfileBinding(),
    ),
    GetPage(
      name: _Paths.call,
      page: () => CallPage(
        roomId: Get.arguments?['roomId'],
        userId:  Get.arguments?['userId'],
        user: Get.arguments?['user'],
        isCaller: Get.arguments['isCaller'],
        inCalling: Get.arguments?['inCalling'] ?? false,
        callTiming: Get.arguments?['callTiming'] ?? 0,
        isStartTime: Get.arguments?['isStartTime'] ?? false,
      ),
      // binding: CallBinding(),
    ),
    GetPage(
      name: _Paths.missingCall,
      page: () => MissingPage(type: Get.arguments['type']),
    ),
    GetPage(
      name: _Paths.callSummary,
      page: () => CallSummary(argument: Get.arguments as CallSummaryArgument,),
      binding: CallSummaryBinding(),
    ),
    GetPage(
      name: _Paths.mainCreator,
      page: () {
        if (Get.arguments != null) {
          return MainCreatorPage(
            currentPage: Get.arguments['bottom_navigation'],
            settingTab: Get.arguments['setting_type'],
          );
        } else {
          return const MainCreatorPage();
        }
      },
      binding: MainCreatorBinding(),
    ),
  ];
}

abstract class _Paths {
  static const String splash = "/splash";
  static const String signIn = "/sign_in";
  static const String forgotPassword = "/forgot_password";
  static const String verifyOtp = "/verify_otp";
  static const String changePassword = "/change_password";
  static const String signUp = "/sign_up";
  static const String registerSuccess = "/register_success";
  static const String main = "/main";
  static const String fanProfile = "/fan_profile";
  static const String fanProfileEdit = "/fan_profile_edit";
  static const String historyChat = "/history_chat";
  static const String settingAccount = '/setting_account';
  static const String infoView = '/info_view';
  static const String passwordEdit = '/password_edit';
  static const String emailEdit = '/email_edit';
  static const String emailVerify = '/email_verify';
  static const String creatorProfile = '/creator_profile';
  static const String creatorProfileEdit = '/creator_profile_edit';
  static const String call = '/call';
  static const String missingCall = '/missing_call';
  static const String callSummary = '/call_summary';
  static const String mainCreator = "/main_creator";
  static const String personalInfoEdit = '/personal_info_edit';

}
