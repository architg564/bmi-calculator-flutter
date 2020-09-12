import 'package:flutter/material.dart';

class Floating extends StatelessWidget {
  final IconData icon;
  final Function weight;
  Floating(this.icon, this.weight);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weight,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
