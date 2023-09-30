import 'package:flutter/material.dart';

class HomeRowHeader extends StatelessWidget {
  const HomeRowHeader({
    super.key,
    required this.table1,
    required this.table2,
    required this.table3,
    required this.table4,
    required this.icon,
  });
  final Widget table1, table2, table3, table4, icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TitleHeaderWidget(flex: 3, child: table1),
        TitleHeaderWidget(flex: 2, child: table2),
        TitleHeaderWidget(flex: 2, child: table3),
        TitleHeaderWidget(flex: 2, child: table4),
        icon,
      ],
    );
  }
}

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({
    super.key,
    required this.child,
    this.flex = 1,
  });
  final Widget child;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: child,
        ));
  }
}
