import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

import 'expenses_list_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenses, {super.key, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseListItem(
            expenses[index],
          ),
        ),
      ),
    );
  }
}
