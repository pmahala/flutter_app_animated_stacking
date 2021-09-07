import 'package:flutter/material.dart';

class ColoredCard extends StatelessWidget {
  final int index;
  ColoredCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 30,
      child: Card(
        color: index % 2 == 0 ? Colors.blue : Colors.pinkAccent,
        shape: StadiumBorder(),
      ),
    );
  }
}
