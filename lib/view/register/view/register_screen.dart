import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ลงทะเบียน')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'อีเมล'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'รหัสผ่าน'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('ลงทะเบียน'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
