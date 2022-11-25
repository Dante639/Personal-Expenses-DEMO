import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double SpendingAmount;
  final double SpendingPcOfTotal;

  ChartBar(this.label, this.SpendingAmount, this.SpendingPcOfTotal);

  @override
  Widget build(BuildContext context) {
    //print(label); crash test
    return Column(
      children: [
        Container(height: 20,
            child: FittedBox(
                child: Text(
          '\$${SpendingAmount.toStringAsFixed(0)}',
          style: TextStyle(color: Colors.black87),
        ))),
        SizedBox(
          height: 7,
        ),
        Container(
          height: 100,
          width: 30,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 7.0),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.4),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: SpendingPcOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20.4),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
