import 'package:flutter/material.dart';
import 'trip_plan_result_screen.dart';

import 'budget_input_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ไปแหน่ Pai Nae!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'โปรไฟล์',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'การตั้งค่า',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Text(
            //   'ไปเที่ยวกันเถอะ!',
            //   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 16),
            const Text(
              'เตรียมตังให้พร้อมแล้วออกไปเที่ยวฮีลใจกันเถอะ!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.lightbulb),
              label: const Text('แนะนำแพลนทริปเที่ยว'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/plan');
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('สร้างทริปเที่ยวดด้วยตัวคุณ'),
              onPressed: () {
                Navigator.pushNamed(context, '/budget');
              },
            ),
          ],
        ),
      ),
    );
  }
}
