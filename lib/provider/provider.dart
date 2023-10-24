// Step 1: Create a custom StateNotifier class
import 'package:budget_app/view/home.dart';

class HomeRowHeaderItem {
   int id;
 String expenses;
   int budget;
   int usedBal;
   int currentBal;

   HomeRowHeaderItem(
      {required this.expenses,
      required this.budget,
      required this.usedBal,
      required this.currentBal,
      required this.id});
  @override
  String toString() {
    return 'HomeRowHeaderItem(id: $id)';
  }
}
