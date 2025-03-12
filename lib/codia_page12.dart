import 'dart:math';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page08.dart';
import 'package:codia_demo_flutter/correct_answer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Make sure to import provider
import 'package:collection/collection.dart';

class CodiaPage12 extends StatefulWidget {
  const CodiaPage12({super.key});

  @override
  State<CodiaPage12> createState() => _CodiaPageState12();
}

class _CodiaPageState12 extends State<CodiaPage12> {
  final List<List<String>> answerSets = [
    ['หน้า', 'ผ้าไหม', 'วัด', 'มะลิ', 'สีแดง'],
    ['บ้าน', 'ตา', 'เสือ', 'วิทยุ', 'สีเหลือง'],
    ['หน้า', 'สีเหลือง', 'เสือ', 'มะลิ', 'หนังสือ'],
    ['ทีวี', 'บ้าน', 'ผ้าไหม', 'สีแดง', 'มะลิ'],
    ['วัด', 'ตา', 'หนังสือ', 'วิทยุ', 'บ้าน'],
    ['หน้า', 'วิทยุ', 'เสือ', 'ผ้าไหม', 'สีเหลือง'],
    ['ทีวี', 'มะลิ', 'สีแดง', 'เสือ', 'ตา'],
    ['วัด', 'ผ้าไหม', 'บ้าน', 'หนังสือ', 'สีเหลือง'],
    ['มะลิ', 'เสือ', 'วิทยุ', 'สีแดง', 'ตา'],
    ['หน้า', 'สีเหลือง', 'บ้าน', 'วิทยุ', 'ผ้าไหม'],
    ['ตา', 'เสือ', 'สีแดง', 'มะลิ', 'วัด'],
    ['หนังสือ', 'ทีวี', 'สีเหลือง', 'บ้าน', 'เสือ'],
    ['ผ้าไหม', 'มะลิ', 'วิทยุ', 'บ้าน', 'สีแดง'],
    ['วัด', 'มะลิ', 'สีเหลือง', 'ผ้าไหม', 'ตา'],
    ['บ้าน', 'เสือ', 'วิทยุ', 'หนังสือ', 'สีแดง'],
    ['หน้า', 'ทีวี', 'มะลิ', 'เสือ', 'สีเหลือง'],
    ['วิทยุ', 'หนังสือ', 'ผ้าไหม', 'บ้าน', 'สีแดง'],
    ['ตา', 'มะลิ', 'เสือ', 'สีเหลือง', 'บ้าน'],
    ['หน้า', 'บ้าน', 'วิทยุ', 'มะลิ', 'หนังสือ'],
    ['สีแดง', 'ผ้าไหม', 'เสือ', 'ทีวี', 'วัด']
  ];

  List<List<String>> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    _selectRandomAnswers();
  }

  // Select random answers but always include the correct answer
  void _selectRandomAnswers() {
    Random random = Random();
    final correctAnswer = Provider.of<CorrectAnswerProvider>(context, listen: false).correctAnswer;

    // Ensure the correct answer is in the randomly selected answers
    selectedAnswers = List.generate(4, (index) {
      return answerSets[random.nextInt(answerSets.length)];
    });

    // Insert the correct answer randomly into the selected answers
    selectedAnswers.insert(random.nextInt(selectedAnswers.length + 1), correctAnswer);

    setState(() {print(correctAnswer);});
  }

  // Check if the selected answer matches the correct one from the provider
  void _checkAnswer(List<String> selectedAnswer) {
    final correctAnswer = Provider.of<CorrectAnswerProvider>(context, listen: false).correctAnswer;

    // Sort both lists before comparing to ignore order
    if (ListEquality().equals(List.from(selectedAnswer)..sort(), List.from(correctAnswer)..sort())) {
      print('ถูกต้อง');  // Correct answer
    } else {
      print('ผิด');  // Incorrect answer
    }
    print(correctAnswer);
    print(selectedAnswer);
  }

  // Widget for footer button
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
          // Navigate to the main page when "ออก" button is pressed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage(), // Navigate to main page (CodiaPage)
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          // Navigate to the next page when "ข้อต่อไป" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage08(), // Navigate to next page (CodiaPage08)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1366,
          height: 1024,
          decoration: const BoxDecoration(
            color: Color(0xffe5f5f8),
          ),
          child: Stack(
            children: [
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
                          'เลือกประโยคที่ตรงกับข้อก่อนหน้า',
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
              Positioned(
                top: 280,
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
                      const SizedBox(height: 60),
                      // Display selected answers as buttons
                      ...selectedAnswers.map((answerSet) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _checkAnswer(answerSet); // Check answer when button is pressed
                            },
                            child: Text(
                              answerSet.join(', '),
                              style: const TextStyle(color: Colors.white), // Change text color to white
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                              backgroundColor: Colors.purple,
                            ),
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              // Footer Section
              Positioned(
                bottom: 0,
                left: 64,
                right: 64,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff14967f),
                    borderRadius: BorderRadius.circular(30),
                  ),
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
}
