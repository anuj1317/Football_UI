import 'package:flutter/material.dart';

class Barcelona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/barcelona.jpg'),
            fit: BoxFit.cover
          )
      ),
    );
  }
}
