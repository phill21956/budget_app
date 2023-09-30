import 'package:budget_app/provider/provider.dart';
import 'package:budget_app/view/components/form_line_widget.dart';
import 'package:budget_app/view/components/home_header_card.dart';
import 'package:budget_app/view/components/home_row_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});
  final String mode = kDebugMode ? 'Debug Mode' : 'Release Mode';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final formLine = ref.watch(homeRowHeaderListProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const HeaderCard(),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Spending Plan: $mode',
                  style: TextStyle(color: Colors.grey[800], fontSize: 16))),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: HomeRowHeader(
              table1: Text('Expenses'),
              table2: Text('Budget'),
              table3: Text('Used Bal'),
              table4: Text('Curr Bal'),
              icon: Spacer(),
            ),
          ),
          Expanded(child: FormFieldLine())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200],
        onPressed: () {
          ref
              .read(homeRowHeaderListProvider.notifier)
              .addHomeRowHeader(FormFieldLine());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
