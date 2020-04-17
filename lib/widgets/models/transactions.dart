import 'package:flutter/material.dart';

class Transaction {
  double amount;
  int id;
  String title;
  DateTime date;
  Transaction({@required this.amount,@required this.date,@required this.id,@required this.title});
}


