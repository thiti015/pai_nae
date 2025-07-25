import 'package:flutter/material.dart';
import '../../detail_trip/view/trip_plan_result_screen.dart';

class BudgetInputScreen extends StatefulWidget {
  @override
  _BudgetInputScreenState createState() => _BudgetInputScreenState();
}

class _BudgetInputScreenState extends State<BudgetInputScreen> {
  final _budgetController = TextEditingController();
  String selectedProvince = 'กรุงเทพฯ';
  List<String> provinces = ['กรุงเทพฯ', 'เชียงใหม่', 'กาญจนบุรี'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ไปแหน่! เที่ยวตามงบ')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'งบประมาณของคุณ (บาท)'),
            ),
            const SizedBox(height: 16),
            const Text('เลือกจังหวัดที่ต้องการเที่ยว', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedProvince,
              onChanged: (value) {
                setState(() => selectedProvince = value!);
              },
              items: provinces.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/LocationSelectScreen',
                  arguments: {
                    'province': selectedProvince,
                    'budget': double.tryParse(_budgetController.text) ?? 0,
                  },
                );
              },
              child: Text('ถัดไป'),
            )
          ],
        ),
      ),
    );
  }
}
