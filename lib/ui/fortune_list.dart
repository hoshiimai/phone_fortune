import 'package:flutter/material.dart';
import 'package:phone_fortune/models/fortune_teller.dart';
import 'package:phone_fortune/ui/fortune_teller_list.dart';

class FortuneList extends StatelessWidget {
  final List<FortuneTeller> fortuneTellers = [
    FortuneTeller(
      name: 'T・YOZAWA',
      status: '鑑定中',
      queue: '10人待ち',
      price: '1分370円',
      time: '12:00〜13:00',
    ),
    FortuneTeller(
      name: '三角クリップ占',
      status: '待機中',
      queue: '1人待ち',
      price: '1分450円',
      time: '17:00〜19:00',
    ),
    FortuneTeller(
      name: '海馬風水',
      status: '準備中',
      queue: '4人待ち',
      price: '1分350円',
      time: '20:00〜23:00',
    ),
    FortuneTeller(
      name: '天草五郎時貞',
      status: '鑑定中',
      queue: '0人待ち',
      price: '1分380円',
      time: '23:00〜27:00',
    ),
    FortuneTeller(
      name: '三角クリップ占',
      status: '離席中',
      queue: '1人待ち',
      price: '1分450円',
      time: '17:00〜19:00',
    ),
    FortuneTeller(
      name: '海馬風水',
      status: '準備中',
      queue: '4人待ち',
      price: '1分350円',
      time: '20:00〜23:00',
    ),
    FortuneTeller(
      name: '天草五郎時貞',
      status: '待機中',
      queue: '0人待ち',
      price: '1分380円',
      time: '23:00〜27:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FortuneTellerList(tellers: fortuneTellers);
  }
}
