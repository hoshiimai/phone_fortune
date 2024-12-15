abstract class DeepLink {
  DeepLinkAction type;

  DeepLink(this.type);
}

class SystemNoticeDeepLink extends DeepLink {
  SystemNoticeDeepLink() : super(DeepLinkAction.systemNotice);
}

enum DeepLinkAction {
  systemNotice,
}
