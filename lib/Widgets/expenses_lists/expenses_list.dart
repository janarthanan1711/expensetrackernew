import 'package:flutter/cupertino.dart';

import '../../Models/expensemodel.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;


  @override
  Widget build(BuildContext context){
     return ListView.builder(
         itemCount: expenses.length,
         itemBuilder: (context,index){
         return Dismissible(key: ValueKey(expenses[index]),
             onDismissed: (direction){
               removeExpense(expenses[index]);
             },
             child: ExpenseItem(expenses[index]));
     }

     );
  }
}