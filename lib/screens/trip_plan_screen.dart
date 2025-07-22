import 'package:flutter/material.dart';

class TripPlanScreen extends StatelessWidget {
  const TripPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trips = [
      {
        'title': 'ทริปสายธรรมชาติ กาญจนบุรี',
        'desc': 'สะพานข้ามแม่น้ำแคว, น้ำตกเอราวัณ, Jungle Cafe',
      },
      {
        'title': 'ทริปสายชิล เชียงใหม่',
        'desc': 'ดอยสุเทพ, ถนนนิมมาน, คาเฟ่สวยๆ',
      },
      {
        'title': 'ทริปสายวัฒนธรรม กรุงเทพฯ',
        'desc': 'วัดพระแก้ว, เยาวราช, ICONSIAM',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('ระบบแนะนำแพลนทริป')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(Icons.travel_explore, color: Colors.blueAccent),
              title: Text(trip['title']!),
              subtitle: Text(trip['desc']!),
              trailing: ElevatedButton(
                child: const Text('ดูรายละเอียด'),
                onPressed: () {
                  Navigator.pushNamed(context, '/detail');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
