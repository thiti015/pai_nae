import 'package:flutter/material.dart';

class SaveTripScreen extends StatelessWidget {
  const SaveTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บันทึกแผนทริป')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('แชร์'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('Export'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('ปักหมุดแผนที่'),
              onPressed: () {},
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              icon: Icon(Icons.home),
              label: Text('กลับหน้าหลัก'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
