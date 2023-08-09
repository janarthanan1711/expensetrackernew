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
     useSafeArea: true,
     isScrollControlled: true,
       context: context, builder: (context){
     return NewExpense(onAddExpense: addExpense,);
   });
 }

 void addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
 }
 void removeExpense(Expense expense){
   final expenseIndex = _registeredExpenses.indexOf(expense);
   setState(() {
     _registeredExpenses.remove(expense);
   });
   ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
         duration: const Duration(seconds: 3),
         content: const Text('Expense Deleted.'),
         action: SnackBarAction(label: 'Undo', onPressed: (){
           setState(() {
             _registeredExpenses.insert(expenseIndex, expense);
           });
         }),
   )
   );
 }

  @override
  Widget build(BuildContext context) {
   final screenWidth =  MediaQuery.of(context).size.width;
   Widget mainContent = const Center(child: Text('No expenses found. Start adding some!'));

   if(_registeredExpenses.isNotEmpty){
     mainContent = ExpensesList(
         removeExpense: removeExpense,
         expenses: _registeredExpenses);
   }
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
          body: screenWidth < 600 ? Column(
            children: [
              const Text('the Chart'),
              Expanded(child: mainContent)
            ],
          ) : Row(
            children: [
              const Text('the Chart'),
              Expanded(child: mainContent)
            ],
          ),

    )
    );
  }
}
