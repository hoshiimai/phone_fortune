import '../enum/enum_bottom_navigation_page.dart';

class PageNavigation {
  final String childPageName;
  final BottomNavigationPage? rootPage;
  final Map<String, dynamic>? childPageArguments;

  PageNavigation({
    required this.childPageName,
    required this.rootPage,
    this.childPageArguments,
  });
}