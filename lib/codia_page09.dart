import 'dart:math';
import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page10.dart';

class CodiaPage09 extends StatefulWidget {
  const CodiaPage09({super.key});

  @override
  State<CodiaPage09> createState() => _CodiaPageState09();
}

class _CodiaPageState09 extends State<CodiaPage09> {
  String input = "";
  List<int> randomNumbers = [];

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  // ฟังก์ชันสุ่มเลข 3 ตัว
  void _generateRandomNumbers() {
    Random random = Random();
    randomNumbers = List.generate(3, (_) => random.nextInt(10)); // สุ่มเลข 0-9
    setState(() {});
  }

  // เพิ่มตัวเลขที่ผู้ใช้เลือก
  void _addNumber(String number) {
    setState(() {
      input += number;
    });
  }

  // ลบตัวเลขตัวสุดท้ายที่กด
  void _deleteLastNumber() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  // ตรวจสอบคำตอบ (ต้องตอบย้อนกลับ)
  void _submitInput() {
    String correctAnswer = randomNumbers.reversed.join(''); // คำตอบที่ถูกต้อง (ย้อนกลับ)
    if (input == correctAnswer) {
      _showDialog("ถูกต้อง!", "คุณตอบถูกต้อง 🎉");
    } else {
      _showDialog("ผิดพลาด", "กรุณาลองใหม่ ❌");
    }
  }

  // แสดง Dialog แจ้งผลลัพธ์
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (title == "ถูกต้อง!") {
                  _generateRandomNumbers();
                  setState(() {
                    input = "";
                  });
                }
              },
              child: Text("ตกลง"),
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันสร้างปุ่มตัวเลข
  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 100,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 143,
              color: const Color(0xff095d7e),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/image_317526.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'MoCA Check \nAssessment',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.volume_up, color: Colors.white, size: 36),
                  const SizedBox(width: 8),
                  const Text(
                    'ฟังเสียง',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "จำเลขชุดนี้: ${randomNumbers.join(' ')}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "คุณเลือก: $input",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("1", Colors.purple, () => _addNumber("1")),
                        SizedBox(width: 10),
                        _buildButton("2", Colors.purple, () => _addNumber("2")),
                        SizedBox(width: 10),
                        _buildButton("3", Colors.purple, () => _addNumber("3")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("4", Colors.purple, () => _addNumber("4")),
                        SizedBox(width: 10),
                        _buildButton("5", Colors.purple, () => _addNumber("5")),
                        SizedBox(width: 10),
                        _buildButton("6", Colors.purple, () => _addNumber("6")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("7", Colors.purple, () => _addNumber("7")),
                        SizedBox(width: 10),
                        _buildButton("8", Colors.purple, () => _addNumber("8")),
                        SizedBox(width: 10),
                        _buildButton("9", Colors.purple, () => _addNumber("9")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton("ลบ", Colors.red, _deleteLastNumber),
                        SizedBox(width: 10),
                        _buildButton("0", Colors.purple, () => _addNumber("0")),
                        SizedBox(width: 10),
                        _buildButton("OK", Colors.green, _submitInput),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xff14967f),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton('ออก', Colors.red, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const CodiaPage()),
                    );
                  }),
                  _buildButton('ข้อต่อไป', Colors.purple, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CodiaPage10()),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
