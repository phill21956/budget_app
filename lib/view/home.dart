import 'package:budget_app/provider/provider.dart';
import 'package:budget_app/view/components/form_line_widget.dart';
import 'package:budget_app/view/components/home_header_card.dart';
import 'package:budget_app/view/components/home_row_form.dart';
import 'package:budget_app/view/components/home_row_header.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<HomeRowHeaderItem> homeRow = [];
  int count = 0;

  void addForm() {
    count += 1;
    setState(() {
      homeRow.add(HomeRowHeaderItem(
        id: count,
        budget: 0,
        currentBal: 0,
        expenses: '',
        usedBal: 0,
      ));
      print(homeRow);
    });
  }

  void removeForm(int id) {
    setState(() {
      if (homeRow.length > 1) {
        homeRow.removeWhere((element) => element.id == id);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    addForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const HeaderCard(),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Spending Plan:',
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
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: homeRow.length,
                itemBuilder: (context, index) {
                  final item = homeRow[index];
                  // print('sksdjd:${item}');
                  return HomeRowForm(
                    homeRowHeaderItem: item,
                    onPressed: () => removeForm(item.id),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200],
        onPressed: () => addForm(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
