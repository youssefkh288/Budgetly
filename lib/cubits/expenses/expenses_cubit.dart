import 'package:budgetly/cubits/expenses/expenses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/expenses.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseState([]));

  void addExpense(Expenses expense) {
    final updated = List<Expenses>.from(state.expenses)..insert(0, expense);
    emit(ExpenseState(updated));
  }

  void deleteExpense(int index) {
    final updated = List<Expenses>.from(state.expenses)..removeAt(index);
    emit(ExpenseState(updated));
  }
}