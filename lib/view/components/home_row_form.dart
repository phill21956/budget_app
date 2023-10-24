
import 'package:budget_app/provider/provider.dart';
import 'package:budget_app/view/components/form_line_widget.dart';
import 'package:flutter/material.dart';

import 'home_row_header.dart';

class HomeRowForm extends StatefulWidget {
  HomeRowForm({
    super.key,
    this.onPressed,
    required this.homeRowHeaderItem,
  });
  final Function()? onPressed;
  final HomeRowHeaderItem homeRowHeaderItem;
  @override
  State<HomeRowForm> createState() => _HomeRowFormState();
}

class _HomeRowFormState extends State<HomeRowForm> {
  final list = [
    'Personal',
    'Church',
    'Home',
    'Work',
    'Givings',
    'Tithes',
    'Others',
  ];

  final budgetController = TextEditingController();

  final usedBalController = TextEditingController();

  final currentBalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return HomeRowHeader(
      table1: DropdownButtonFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          isDense: true,
        ),
        isExpanded: true,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(value, textAlign: TextAlign.center)),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            widget.homeRowHeaderItem.expenses = value!;
          });
        },
      ),
      table2: CustomTextForm(
        textEditingController: budgetController,
        enabled: true,
        onChanged: (value) {
          setState(() {
            widget.homeRowHeaderItem.budget = int.tryParse(value) ?? 0;
          });
        },
      ),
      table3: CustomTextForm(
        textEditingController: usedBalController,
        enabled: true,
        onChanged: (value) {
          setState(() {
            widget.homeRowHeaderItem.usedBal = int.tryParse(value) ?? 0;
          });
        },
      ),
      table4: CustomTextForm(
        enabled: false,
        hintText: currentBalController.text,
        onChanged: (value) {
          setState(() {
            widget.homeRowHeaderItem.currentBal = int.tryParse(value) ?? 0;
          });
        },
      ),
      icon: IconButton(
          onPressed: () => widget.onPressed?.call(),
          icon: const Icon(Icons.delete, color: Colors.red)),
    );
  }
}
