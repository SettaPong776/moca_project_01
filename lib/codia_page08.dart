import 'dart:math';
import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page09.dart';

class CodiaPage08 extends StatefulWidget {
  const CodiaPage08({super.key});

  @override
  State<CodiaPage08> createState() => _CodiaPageState08();
}

class _CodiaPageState08 extends State<CodiaPage08> {
  String input = "";
  List<int> randomNumbers = [];

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  void _generateRandomNumbers() {
    Random random = Random();
    randomNumbers = List.generate(5, (_) => random.nextInt(10));
    setState(() {});
  }

  void _addNumber(String number) {
    setState(() {
      input += number;
    });
  }

  void _deleteLastNumber() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  void _submitInput() {
    if (input == randomNumbers.join('')) {
      _showDialog("ถูกต้อง!", "คุณตอบถูกต้อง 🎉");
    } else {
      _showDialog("ผิดพลาด", "กรุณาลองใหม่ ❌");
    }
  }

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

  Widget _buildFooterButton(String text, Color color) {
    return SizedBox(
      width: 150,  // Adjust the width
      height: 60,  // Adjust the height
      child: ElevatedButton(
        onPressed: () {
          if (text == 'ออก') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CodiaPage()),
            );
          } else if (text == 'ข้อต่อไป') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CodiaPage09()),
            );
          }
        },
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
          // Instruction Section
          Positioned(
            top: 160,
            left: 64,
            right: 64,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff14967f),
                    borderRadius: BorderRadius.circular(57),
                  ),
                  child: const Center(
                    child: Text(
                      'จงฟังเสียงอ่านชุดตัวเลขและเลือกตัวเลขตามลำดับที่ได้ยิน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
          // Footer Section
          Positioned(
            bottom: 0,
            child: Container(
              width: 1366,  // Set the width to 1366 as per your request
              height: 161,  // Set the height to 161 as per your request
              decoration: const BoxDecoration(
                color: Color(0xff14967f),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFooterButton('ออก', Colors.red),  // Custom button method
                  _buildFooterButton('ข้อต่อไป', Colors.purple),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
