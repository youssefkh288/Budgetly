import 'package:flutter/material.dart';

class Expenses {
  double amount;
  String title;
  DateTime date;
  final IconData icon;
  final Color color;

  Expenses({
    required this.amount,
    required this.title,
    required this.date,
    this.icon = Icons.miscellaneous_services,
    this.color = Colors.grey,
  });
}
