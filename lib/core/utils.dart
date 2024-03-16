import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/air_raid.dart';
import '../widgets/app_bar_list_card.dart';

const List<AppBarCard> appBarCardsList = [
  AppBarCard(
    text: 'Придбати QR-квиток',
    iconData: Icons.qr_code,
  ),
  AppBarCard(
    text: 'Транспортна карта',
    iconData: Icons.credit_card,
  ),
  AppBarCard(
    text: 'Погодинне паркування',
    iconData: Icons.timer,
  ),
  AppBarCard(
    text: 'Часті питання',
    iconData: Icons.question_mark,
  ),
];

List<dynamic> flattenedList = [];

void formList() {
  for (int i = 0; i < 10; i++) {
    flattenedList.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Text(
          '${16 - i} березня',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    for (int j = 0; j < 10; j++) {
      flattenedList.add(
        AirRaidWidget(
          canceled: j % 2 == 0,
          time: TimeOfDay(hour: Random().nextInt(24), minute: Random().nextInt(60)),
        ),
      );
    }
  }
}