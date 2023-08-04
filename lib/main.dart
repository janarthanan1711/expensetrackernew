import 'package:flutter/material.dart';

import 'Widgets/expenses.dart';

void main(){
  runApp( MaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}