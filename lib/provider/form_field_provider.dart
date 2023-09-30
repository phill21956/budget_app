import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formFieldLineProvider =
    StateNotifierProvider<FormProvider, FormProviderData>((ref) {
  return FormProvider();
});

// final ldataList = Provider((ref) => list);
// final  list = [
//   'Personal',
//   'Church',
//   'Home',
//   'Work',
//   'Givings',
//   'Tithes',
//   'Others',
// ];

class FormProviderData {
  final List<String> categories;
  final List<TextEditingController> budgetControllers;
  final List<TextEditingController> usedBalanceControllers;

  FormProviderData({
    required this.categories,
    required this.budgetControllers,
    required this.usedBalanceControllers,
  });
}

class FormProvider extends StateNotifier<FormProviderData> {
  FormProvider()
      : super(FormProviderData(
          categories: [
            'Personal',
            'Church',
            'Home',
            'Work',
            'Givings',
            'Tithes',
            'Others',
          ],
          budgetControllers: [],
          usedBalanceControllers: [],
        ));

  addBudgetController(TextEditingController controller) {
    state.budgetControllers.add(controller);
  }

  addUsedBalanceController(TextEditingController controller) {
    state.usedBalanceControllers.add(controller);
  }

  int calculateCurrBalance(int index) {
    if (index < 0 ||
        index >= state.budgetControllers.length ||
        index >= state.usedBalanceControllers.length) {
      return 0; // Return a default value when index is out of bounds or lists are empty
    }

    final budgetController = state.budgetControllers[index];
    final usedBalanceController = state.usedBalanceControllers[index];

    final budgetText = budgetController.text;
    final usedBalanceText = usedBalanceController.text;
    print('BAL1:$budgetText');
    print('BAL2:$usedBalanceText');
    if (budgetText.isNotEmpty && usedBalanceText.isNotEmpty) {
      final budget = int.tryParse(budgetText) ?? 0;
      final usedBalance = int.tryParse(usedBalanceText) ?? 0;
      final balance = budget - usedBalance;
      print('BAL:$balance');
      return balance;
    } else {
      return 0;
    }
  }
}
