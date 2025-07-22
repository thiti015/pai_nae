import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เข้าสู่ระบบ')),
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
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('เข้าสู่ระบบ'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            TextButton(
              child: Text('ลงทะเบียน'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
