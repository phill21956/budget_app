import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  const SizedBox(height: 10),
                Text('B A L A N C E',
                    style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                Text('\$20,000',
                    style: TextStyle(color: Colors.grey[800], fontSize: 40)),
                Text('INCOME: \$500,000',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
