import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page11.dart';
import 'dart:async';
import 'dart:math';

class CodiaPage10 extends StatefulWidget {
  const CodiaPage10({super.key});

  @override
  State<CodiaPage10> createState() => _CodiaPageState10();
}

class _CodiaPageState10 extends State<CodiaPage10> {
  int displayedNumber = 0;
  int score = 0;
  late Timer timer;
  int remainingTime = 60; // 1 minute
  Random random = Random();
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Start a 1-minute timer and update the number every second
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
          displayedNumber = random.nextInt(2); // Generates 0 or 1
        });
      } else {
        setState(() {
          gameOver = true;
          timer.cancel(); // Stop the timer after 1 minute
        });
      }
    });
  }

  // Function to handle button press
  void onButtonPressed() {
    if (!gameOver && displayedNumber == 1) {
      setState(() {
        score++;
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1366,
          height: 1024,
          decoration: const BoxDecoration(
            color: Color(0xffe5f5f8), // พื้นหลังสีฟ้าอ่อน
          ),
          child: Stack(
            children: [
              // Header Section
              Positioned(
                top: 0,
                child: Container(
                  width: 1366,
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
                          'ภายใน 1 นาที จะมีตัวเลขแสดงขึ้นมาแบบสุ่ม และ \nให้ผู้ทดสอบกดปุ่มสีแดงเมื่อเห็นเลข 1 แสดงขึ้นมา',
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

              // Main Content Section
              Positioned(
                top: 320,
                left: 64,
                right: 64,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xff000000), width: 1),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      // Display Timer
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '00:${remainingTime < 10 ? '0' : ''}$remainingTime',
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Display Random Number
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '$displayedNumber',
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),

                      // Red Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 26),
                        ),
                        onPressed: onButtonPressed,
                        child: const Text(
                          'คลิก',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),

                      // Show score
                      const SizedBox(height: 30),
                      Text(
                        'Score: $score',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // Footer Section
              Positioned(
                bottom: 0,
                child: Container(
                  width: 1366,
                  height: 161,
                  decoration: const BoxDecoration(
                    color: Color(0xff14967f),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFooterButton('ออก', Colors.red),
                      _buildFooterButton('ข้อต่อไป', Colors.purple),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Footer Buttons
  Widget _buildFooterButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      ),
      onPressed: () {
        if (text == 'ออก') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage(), // Go to main page
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage11(), // Go to next page
            ),
          );
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
