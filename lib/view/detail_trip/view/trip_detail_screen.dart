import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รายละเอียดแต่ละจุด')),
      body: Center(
        child: ElevatedButton(
          child: const Text('บันทึกแผนทริป'),
          onPressed: () {
            Navigator.pushNamed(context, '/save');
          },
        ),
      ),
    );
  }
}
