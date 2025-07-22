import 'package:flutter/material.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  String selectedPlace = 'กรุงเทพฯ';
  double? budget;
  List<Map<String, dynamic>> interestingPlaces = [];
  Set<int> selectedIndexes = {};

  final places = ['กรุงเทพฯ', 'เชียงใหม่', 'กาญจนบุรี', 'ภูเก็ต'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map) {
      if (args['province'] != null && places.contains(args['province'])) {
        selectedPlace = args['province'];
      }
      if (args['budget'] != null) {
        budget = args['budget'] is double ? args['budget'] : double.tryParse(args['budget'].toString());
      }
    }
    interestingPlaces = _getInterestingPlacesData(selectedPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('จัดการทริปเที่ยว')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('จังหวัดที่เลือก: $selectedPlace', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (budget != null)
              Text('งบประมาณ: ${budget!.toStringAsFixed(0)} บาท', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text('สถานที่เที่ยวที่น่าสนใจ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(interestingPlaces.length, (index) {
              final place = interestingPlaces[index];
              final cost = (place['cost'] as num).toDouble();
              final name = place['name'] as String;
              final canGo = budget == null || budget! >= cost;
              final isSelected = selectedIndexes.contains(index);
              return Card(
                color: isSelected ? Colors.green[100] : (canGo ? Colors.white : Colors.grey[200]),
                child: ListTile(
                  title: Text(name),
                  subtitle: Text('ประมาณ ${cost.toStringAsFixed(0)} บาท'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        tooltip: 'ดูรายละเอียด',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(name),
                              content: Text('รายละเอียดสถานที่เที่ยว: $name\nค่าใช้จ่ายประมาณ ${cost.toStringAsFixed(0)} บาท'),
                              actions: [
                                TextButton(
                                  child: const Text('ปิด'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(isSelected ? Icons.check_circle : Icons.radio_button_unchecked, color: canGo ? Colors.green : Colors.grey),
                        tooltip: canGo
                            ? (isSelected ? 'เอาออกจากรายการ' : 'เลือกสถานที่นี้')
                            : 'งบไม่ถึง ไม่สามารถเลือก',
                        onPressed: canGo
                            ? () {
                                setState(() {
                                  if (isSelected) {
                                    selectedIndexes.remove(index);
                                  } else {
                                    selectedIndexes.add(index);
                                  }
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('ถัดไป'),
              onPressed: selectedIndexes.isNotEmpty
                  ? () {
                      final selectedList = selectedIndexes.map((i) => interestingPlaces[i]).toList();
                      final totalCost = selectedList.fold<double>(0, (sum, item) => sum + (item['cost'] as num).toDouble());
                      Navigator.pushNamed(
                        context,
                        '/plan',
                        arguments: {
                          'province': selectedPlace,
                          'places': selectedList,
                          'totalCost': totalCost,
                          'budget': budget,
                        },
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
  List<Map<String, dynamic>> _getInterestingPlacesData(String province) {
    final data = {
      'กรุงเทพฯ': [
        {'name': 'วัดพระแก้ว', 'cost': 500},
        {'name': 'เยาวราช', 'cost': 300},
        {'name': 'ICONSIAM', 'cost': 400},
      ],
      'เชียงใหม่': [
        {'name': 'ดอยสุเทพ', 'cost': 600},
        {'name': 'ถนนนิมมาน', 'cost': 350},
        {'name': 'คาเฟ่สวยๆ', 'cost': 250},
      ],
      'กาญจนบุรี': [
        {'name': 'สะพานข้ามแม่น้ำแคว', 'cost': 0},
        {'name': 'น้ำตกเอราวัณ', 'cost': 200},
        {'name': 'Jungle Cafe', 'cost': 80},
      ],
      'ภูเก็ต': [
        {'name': 'หาดป่าตอง', 'cost': 0},
        {'name': 'แหลมพรหมเทพ', 'cost': 0},
        {'name': 'คาเฟ่ริมทะเล', 'cost': 300},
      ],
    };
    return List<Map<String, dynamic>>.from(data[province] ?? []);
  }
}
