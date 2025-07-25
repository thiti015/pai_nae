import 'package:flutter/material.dart';

class ModeSelectScreen extends StatelessWidget {
  const ModeSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เลือกโหมด')),
      body: Center(
        child: ElevatedButton(
          child: const Text('เที่ยวตามงบ'),
          onPressed: () {
            Navigator.pushNamed(context, '/budget');
          },
        ),
      ),
    );
  }
}
