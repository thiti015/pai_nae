import 'package:flutter/material.dart';

class TripPlanResultScreen extends StatelessWidget {
  final double budget;
  final String province;

  TripPlanResultScreen({required this.budget, required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แผนเที่ยว: $province')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('งบของคุณ: ${budget.toStringAsFixed(0)} บาท'),
          SizedBox(height: 12),
          TripItemCard(
            time: '08:00',
            activity: 'เดินเล่นสะพานข้ามแม่น้ำแคว',
            cost: 0,
          ),
          TripItemCard(
            time: '10:00',
            activity: 'คาเฟ่ Jungle Cafe',
            cost: 80,
          ),
          TripItemCard(
            time: '13:00',
            activity: 'พิพิธภัณฑ์ทางรถไฟ',
            cost: 40,
          ),
        ],
      ),
    );
  }
}

class TripItemCard extends StatelessWidget {
  final String time;
  final String activity;
  final double cost;

  TripItemCard({required this.time, required this.activity, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text('$time – $activity'),
        subtitle: Text('ประมาณ ${cost.toStringAsFixed(0)} บาท'),
        leading: Icon(Icons.place),
      ),
    );
  }
}
