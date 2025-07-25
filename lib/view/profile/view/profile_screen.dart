import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: 'ตัวอย่าง');
  final _emailController = TextEditingController(text: 'example@email.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('โปรไฟล์')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'ชื่อผู้ใช้'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'อีเมล'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('บันทึก'),
              onPressed: () {
                // TODO: save profile info
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('บันทึกข้อมูลโปรไฟล์เรียบร้อย')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
