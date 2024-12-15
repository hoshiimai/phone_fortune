import 'package:flutter/material.dart';

// Colors constant
class AppColors {
  static const primary = Color(0xFFFFAD00);
  static const secondary = Color(0xFF6ABDDB);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFE4F4F);
  static const transparent = Color(0x00000000);

  static const colorDEDEDE = Color(0xFFDEDEDE);
  static const color6ABDDB = Color(0xFF6ABDDB);
  static const colorFF003B = Color(0xFFFF003B);
  static const colorFF393F = Color(0xFFFF393F);
  static const colorBEBEBE = Color(0xFFBEBEBE);
  static const colorE9E9E9 = Color(0xFFE9E9E9);
  static const colorCFCFCF = Color(0xFFCFCFCF);
  static const colorFBBC05 = Color(0xFFFBBC05);
  static const colorFFD456 = Color(0xFFFFD456);
  static const colorEDAB00 = Color(0xFFEDAB00);
  static const colorFFE085 = Color(0xFFFFE085);
  static const colorDA7EF1 = Color(0xFFDA7EF1);
  static const colorA3A3A3 = Color(0xFFA3A3A3);
  static const colorCA0006 = Color(0xFFCA0006);
  static const colorFFF4D2 = Color(0xFFFFF4D2);
  static const colorC8C8C8 = Color(0xFFC8C8C8);
  static const color656565 = Color(0XFF656565);
  static const color01DF3C = Color(0xFF01DF3C);
  static const colorD9CDFF = Color(0xFFD9CDFF);
  static const colorBFD1FF = Color(0xFFBFD1FF);
  static const colorBFEEFF = Color(0xFFBFEEFF);
  static const color4285F4 = Color(0xFF4285F4);
  static const colorEFEFEF = Color(0xFFEFEFEF);
  static const color1877F2 = Color(0xFF1877F2);
  static const color8A6EDD = Color(0xFF8A6EDD);
  static final black50 = const Color(0xFF000000).withOpacity(0.5);
  static const colorBCBDCB = Color(0xFFBCBDCB);
  static const colorC6C8DC = Color(0xFFC6C8DC);
  static const colorFF7B98 = Color(0xFFFF7B98);
  static const color616161 = Color(0xFF616161);
  static const color222222 = Color(0xFF222222);
  static const colorF2F2F2 = Color(0xFFF2F2F2);
  static const colorFAFAFA = Color(0xFFFAFAFA);
  static const colorB0B9C0 = Color(0xFFB0B9C0);
  static const colorFFBA85 = Color(0xFFFFBA85);
  static const colorFF97D4 = Color(0xFFFF97D4);
  static const colorFFAD00 = Color(0xFFFFAD00);
  static const colorFFB397 = Color(0xFFFFB397);
  static const color35D6C8 = Color(0xFF35D6C8);
  static const color47C66B = Color(0xFF47C66B);
  static const colorC9C9C9 = Color(0xFFC9C9C9);
  static const color64748B = Color(0xFF64748B);
  static const color020617 = Color(0xFF020617);
  static const colorFD5C87 = Color(0xFFFD5C87);
  static const colorF6F6F6 = Color(0xFFF6F6F6);
  static const color9B9B9B = Color(0xFF9B9B9B);
  static const colorFFCE89 = Color(0xFFFFCE89);
  static const colorC7C7C7 = Color(0xFFC7C7C7);
  static const colorFC85A0 = Color(0xFFFC85A0);
  static const color2C374E = Color(0xFF2C374E);
  static const colorD7E2FE = Color(0xFFD7E2FE);

  static LinearGradient gradient(
      {Alignment begin = Alignment.topLeft, end = Alignment.bottomRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFFFAD00),
      Color(0xFFFFB397),
    ]);
  }

  static LinearGradient gradientOffline(
      {Alignment begin = Alignment.topLeft, end = Alignment.bottomRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFA3A3A3),
      Color(0xFFA3A3A3),
    ]);
  }

  static LinearGradient gradientBackgroundOffline(
      {Alignment begin = Alignment.topLeft, end = Alignment.bottomRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFDEDEDE),
      Color(0xFFDEDEDE),
    ]);
  }

  static LinearGradient gradientCalling(
      {Alignment begin = Alignment.topLeft, end = Alignment.bottomRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFEF4471),
      Color(0xFF1877F2),
    ]);
  }

  static LinearGradient gradientSwitch(
      {Alignment begin = Alignment.centerLeft, end = Alignment.centerRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFD9CDFF),
      Color(0xFFBFEEFF),
    ]);
  }

  static LinearGradient gradientSelected(
      {Alignment begin = Alignment.centerLeft, end = Alignment.centerRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFF01DF3C),
      Color(0xFF01DF3C),
    ]);
  }

  static LinearGradient gradientSwitchSelected(
      {Alignment begin = Alignment.centerLeft, end = Alignment.centerRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFFFBA85),
      Color(0xFFFF97D4),
    ]);
  }

  static LinearGradient gradientPoint(
      {Alignment begin = Alignment.centerLeft, end = Alignment.centerRight}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFFFFFAF),
      Color(0xFFFFD53C),
    ]);
  }

  static LinearGradient gradientTopSummary(
      {Alignment begin = Alignment.topCenter, end = Alignment.bottomCenter}) {
    return LinearGradient(begin: begin, end: end, colors: const [
      Color(0xFFFFEFE5),
      Color(0xFFFFFFFF),
    ]);
  }

  static LinearGradient gradientCenterHorizontal(
      {Alignment begin = Alignment.centerLeft,
      end = Alignment.centerRight,
      required Color startColor,
      required Color endColor}) {
    return LinearGradient(begin: begin, end: end, colors: [
      startColor,
      endColor,
    ]);
  }

  static LinearGradient gradientCenterVertical(
      {Alignment begin = Alignment.topCenter,
        end = Alignment.bottomCenter,
        required Color startColor,
        required Color endColor}) {
    return LinearGradient(begin: begin, end: end, colors: [
      startColor,
      endColor,
    ]);
  }
}
