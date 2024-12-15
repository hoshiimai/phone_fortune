import 'package:callmobile/core/model/chat_messsage.dart';
import 'package:callmobile/core/model/faq.dart';
import 'package:callmobile/core/model/response/point_package.dart';
import 'package:callmobile/core/model/tip_point.dart';

List<PointPackage> pointPackage = [
  PointPackage(
    id: 0,
    name: 'P_50',
    amount: 50,
    price: 5,
    createdDate: '2024/06/13 09:20',
  ),
  PointPackage(
    id: 1,
    name: 'P_100',
    amount: 100,
    price: 10,
    createdDate: '2024/06/13 09:20',
  ),
  PointPackage(
    id: 2,
    name: 'P_500',
    amount: 500,
    price: 50,
    createdDate: '2024/06/13 09:20',
  ),
  PointPackage(
    id: 3,
    name: 'P_1000',
    amount: 1000,
    price: 100,
    createdDate: '2024/06/13 09:20',
  ),
  PointPackage(
    id: 4,
    name: 'P_5000',
    amount: 5000,
    price: 500,
    createdDate: '2024/06/13 09:20',
  ),
  PointPackage(
    id: 5,
    name: 'P_10000',
    amount: 10000,
    price: 1000,
    createdDate: '2024/06/13 09:20',
  )
];

List<TipPoint> tipPoints = [
  TipPoint(id: 0, amount: 50),
  TipPoint(id: 1, amount: 100),
  TipPoint(id: 2, amount: 200),
  TipPoint(id: 3, amount: 500),
  TipPoint(id: 4, amount: 1000),
  TipPoint(id: 5, amount: 2000),
  TipPoint(id: 6, amount: 5000),
  TipPoint(id: 7, amount: 10000),
];

List<ChatMessage> messages = [
  ChatMessage(id: 0, messsage: 'テキストが入りますテキストが入ります', fanId: 0, creatorId: 1),
];

List<FAQ> faqs = [
  FAQ(
      isSelected: false,
      title: '質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります',
      content:
          '''答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります.'''),
  FAQ(
      isSelected: false,
      title: '質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります',
      content:
          '''答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります.'''),
  FAQ(
      isSelected: false,
      title: '質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります',
      content:
          '''答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります.'''),
  FAQ(
      isSelected: false,
      title: '質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります',
      content:
          '''答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります.'''),
  FAQ(
      isSelected: false,
      title: '質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります質問が入ります',
      content:
          '''答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります答えが入ります.'''),
];
