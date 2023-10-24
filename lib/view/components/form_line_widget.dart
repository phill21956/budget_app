import 'package:flutter/material.dart';

// class FormFieldLine extends ConsumerWidget {
//  final List<HomeRowHeaderItem> formLine = [];

//   FormFieldLine({
//     super.key,
//   });

//   final TextEditingController budgetController = TextEditingController();

//   final TextEditingController usedBalanceController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final forms = ref.watch(ldataList);
//     // final formFieldLine = ref.read(formFieldLineProvider.notifier);
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: formLine.length,
//         itemBuilder: (context, index) {
//           final form = formLine[index];
//           print('bbzn:${form.id}');
//           return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: HomeRowHeaderItem(
//                 id: form.id,
//                 widget: HomeRowHeader(
//                   table1: DropdownButtonFormField(
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
//                       isDense: true,
//                     ),
//                     isExpanded: true,
//                     style: const TextStyle(fontSize: 14, color: Colors.black),
//                     items: forms
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Text(value, textAlign: TextAlign.center)),
//                       );
//                     }).toList(),
//                     onChanged: (value) {},
//                   ),
//                   table2: const CustomTextForm(
//                     // textEditingController:,
//                     enabled: true,
//                   ),
//                   table3: const CustomTextForm(
//                     // textEditingController:,
//                     enabled: true,
//                   ),
//                   table4: const CustomTextForm(
//                     enabled: false,
//                     // hintText:,
//                   ),
//                   icon: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.delete, color: Colors.red)),
//                 ),
//               ));
//         });
//   }
// }

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    this.textEditingController,
    required this.enabled,
    this.hintText,
    required this.onChanged,
  });
  final TextEditingController? textEditingController;
  final bool enabled;
  String? hintText = '0';
  final Function(String) onChanged;
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
        hintStyle: const TextStyle(color: Colors.black),
        isDense: true,
      ),
      controller: textEditingController,
      enabled: enabled,
      onChanged: onChanged,

      // onChanged: (value) {
      //   value = textEditingController!.text;
      // },
    );
  }
}
