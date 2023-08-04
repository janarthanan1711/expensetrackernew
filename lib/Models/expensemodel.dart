import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category{
  Food,Travel,Lesure,Work
}

const categoryIcons={
  Category.Food : Icons.lunch_dining,
  Category.Travel: Icons.flight_takeoff,
  Category.Lesure: Icons.movie,
  Category.Work : Icons.work
};
class Expense{
  Expense({required this.title,required this.amount,required this.date, required this.category})
  : id= uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}