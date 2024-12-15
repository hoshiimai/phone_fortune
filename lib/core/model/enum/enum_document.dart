import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';

enum DocumentType {
  term,
  privacy,
  commercial,
  askQuestion,
  contactUs;

  String get nameLocalization {
    switch (this) {
      case DocumentType.term:
        return LocaleKey.term.tr;
      case DocumentType.privacy:
        return LocaleKey.privacy.tr;
      case DocumentType.commercial:
        return LocaleKey.commercial.tr;
      case DocumentType.askQuestion:
        return LocaleKey.askQuestion.tr;
      case DocumentType.contactUs:
        return LocaleKey.contactUs.tr;
    }
  }
}
