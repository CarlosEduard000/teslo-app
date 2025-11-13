import 'package:flutter/material.dart';

class CheckAuthStatusScreens extends StatelessWidget {
  const CheckAuthStatusScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
