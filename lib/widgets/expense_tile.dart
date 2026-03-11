import 'package:budgetly/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final Expenses expense;

  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: expense.color.withValues(alpha: 0.15),
        child: Icon(expense.icon, color: expense.color),
      ),
      title: Text(expense.title),
      trailing: Text("-${expense.amount} EGP"),
    );
  }
}
