import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  static const String title = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('شاشة اختبار'),
      ),
      body: const Center(
        child: Text('هل يظهر AppBar؟'),
      ),
    );
  }
}
