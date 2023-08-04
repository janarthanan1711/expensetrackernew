import 'package:expensetrackernew/Widgets/expenses_lists/expenses_list.dart';
import 'package:flutter/material.dart';

import '../Models/expensemodel.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
 final List<Expense> _registeredExpenses = [
   Expense(
     title: 'Flutter Course',
     amount: 499,
     date: DateTime.now(),
     category: Category.Work
   ),
   Expense(
     title: 'Cinema',
     amount: 190,
     date: DateTime.now(),
     category: Category.Lesure
   )
 ];

 void _openAddExpenseOverlay(){
   showModalBottomSheet(
     isScrollControlled: true,
       context: context, builder: (context){
     return  NewExpense(onAddExpense: addExpense,);
   });
 }

 void addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
 }
 void removeExpense(Expense expense){
   setState(() {
     _registeredExpenses.remove(expense);
   });
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Expense Tracker'),
            actions: [
              IconButton(
                onPressed: _openAddExpenseOverlay,
                icon: const Icon(Icons.add),)
            ],
          ),
          body: Column(
            children: [
             const Text('the Chart'),
              Expanded(child: ExpensesList(
                  removeExpense: removeExpense,
                  expenses: _registeredExpenses))
            ],
          ),

    )
    );
  }
}
