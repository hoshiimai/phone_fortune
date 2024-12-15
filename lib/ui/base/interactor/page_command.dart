import 'package:callmobile/core/model/enum/enum_dialog.dart';

abstract class PageCommand {}

class PageCommandShowToast extends PageCommand {
  String msg;

  PageCommandShowToast(this.msg);
}

class PageCommandShowError extends PageCommand {
  String msg;

  PageCommandShowError(this.msg);
}

class PageCommandShowSuccess extends PageCommand {
  String msg;

  PageCommandShowSuccess(this.msg);
}

class PageCommandShowTokenError extends PageCommand {
  PageCommandShowTokenError();
}

class PageCommandShowWarning extends PageCommand {
  PageCommandShowWarning();
}

class PageCommandDialog extends PageCommand {
  final DialogType type;
  final dynamic argument;

  PageCommandDialog({required this.type, this.argument});
}
