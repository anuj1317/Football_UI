import 'package:flutter/material.dart';

class Liverpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/liverpool.jpg'),
            fit: BoxFit.cover
          )
      ),
    );
  }
}
