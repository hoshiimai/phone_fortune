import 'package:callmobile/core/model/business/gender_type.dart.dart';

class VerifyOtpArgument {
  final String fromPage;
  final String email;
  final String? password;
  final String? name;
  final GenderType? gender;
  final DateTime? birthDate;

  VerifyOtpArgument({required this.fromPage, required this.email, this.password, this.name, this.gender, this.birthDate});
}