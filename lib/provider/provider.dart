// Step 1: Create a custom StateNotifier class
import 'package:budget_app/view/components/form_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRowHeaderListNotifier extends StateNotifier<List<HomeRowHeaderItem>> {
  HomeRowHeaderListNotifier()
      : super([HomeRowHeaderItem(id: 0, widget: FormFieldLine())]);

  void addHomeRowHeader(Widget homeRowHeader) {
    final newCounter = state.length;
    final homeRowHeaderItem =
        HomeRowHeaderItem(id: newCounter, widget: homeRowHeader);
    state = [...state, homeRowHeaderItem];
  }

  void removeHomeRowHeader(int id) {
    print('sjj:$id');
    print(state[id].id);
    state = state.where((item) => item.id != id).toList();
    print(state);
  }
}

// Step 2: Create a StateNotifierProvider
final homeRowHeaderListProvider =
    StateNotifierProvider<HomeRowHeaderListNotifier, List<HomeRowHeaderItem>>(
  (ref) => HomeRowHeaderListNotifier(),
);

class HomeRowHeaderItem extends StatelessWidget {
  final int id;
  final Widget widget;

  const HomeRowHeaderItem({super.key, required this.id, required this.widget});
  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
