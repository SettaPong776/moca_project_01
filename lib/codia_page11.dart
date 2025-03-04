import 'dart:math';
import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page12.dart';

class CodiaPage11 extends StatefulWidget {
  const CodiaPage11({super.key});

  @override
  State<CodiaPage11> createState() => _CodiaPageState11();
}

class _CodiaPageState11 extends State<CodiaPage11> {
  String input = "";
  int currentNumber = 90; // Starting number
  int correctAnswerIndex = 0; // Track which number in the sequence we are on

  // List of correct answers (results of subtracting 7 five times)
  final List<int> correctAnswers = [90, 83, 76, 69, 62, 55];

  @override
  void initState() {
    super.initState();
  }

  // Add number to the input string
  void _addNumber(String number) {
    setState(() {
      input += number;
    });
  }

  // Delete the last number in the input string
  void _deleteLastNumber() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  // Submit the user's input and check if it's correct
  void _submitInput() {
    if (input == correctAnswers[correctAnswerIndex].toString()) {
      setState(() {
        currentNumber = correctAnswers[correctAnswerIndex]; // Update the number shown
        correctAnswerIndex++; // Move to the next number in the sequence
        input = ""; // Reset input after correct answer
        if (correctAnswerIndex >= correctAnswers.length) {
          _showDialog("เสร็จสิ้น", "คุณทำถูกต้องทุกครั้ง 🎉");
        }
      });
    } else {
      // If the answer is wrong, don't show anything
      input = ""; // Clear the input for a new attempt
    }
  }

  // Show dialog with feedback
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
              },
              child: Text("ตกลง"),
            ),
          ],
        );
      },
    );
  }

  // Build number button
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
                  "จำเลขชุดนี้: $currentNumber",
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
                      MaterialPageRoute(builder: (context) => const CodiaPage12()),
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
