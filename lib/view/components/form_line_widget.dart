import 'package:budget_app/provider/form_field_provider.dart';
import 'package:budget_app/provider/provider.dart';
import 'package:budget_app/view/components/home_row_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FormFieldLine extends ConsumerWidget {
  FormFieldLine({
    super.key,
  });

  final TextEditingController budgetController = TextEditingController();
  final TextEditingController usedBalanceController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formLine = ref.watch(homeRowHeaderListProvider);
    final forms = ref.watch(formFieldLineProvider);
    final formFieldLine = ref.read(formFieldLineProvider.notifier);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: formLine.length,
        itemBuilder: (context, index) {
          final form = formLine[index];
          print('bbzn:${form.id}');
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HomeRowHeaderItem(
                id: form.id,
                widget: HomeRowHeader(
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
                    items: forms.categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(value, textAlign: TextAlign.center)),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  table2: CustomTextForm(
                    textEditingController:
                        formFieldLine.addBudgetController(budgetController),
                    enabled: true,
                  ),
                  table3: CustomTextForm(
                    textEditingController: formFieldLine
                        .addUsedBalanceController(usedBalanceController),
                    enabled: true,
                  ),
                  table4: CustomTextForm(
                    enabled: false,
                    hintText:
                        formFieldLine.calculateCurrBalance(index).toString(),
                  ),
                  icon: IconButton(
                      onPressed: () {
                        ref
                            .read(homeRowHeaderListProvider.notifier)
                            .removeHomeRowHeader(form.id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red)),
                ),
              ));
        });
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.textEditingController,
    required this.enabled,
    this.hintText,
  });
  final TextEditingController? textEditingController;
  final bool enabled;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        //filled: true,
        hintText: hintText,
        isDense: true,
      ),
      controller: textEditingController,
      enabled: enabled,
      onChanged: (value) {
        value = textEditingController!.text;
      },
    );
  }
}
