// ignore: unused_import
import 'dart:math'; // สำหรับคำนวณ scaling
import 'package:codia_demo_flutter/codia_page09.dart';
import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page11.dart';// ไฟล์ CodiaPage ที่คุณอ้างอิง

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codia Demo Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CodiaPage11(), // ใช้ CodiaPage เป็นหน้าแรกเสมอ
      // home: const CodiaPage15(), // ใช้ CodiaPage เป็นหน้าแรกเสมอ
    );
  }
}
