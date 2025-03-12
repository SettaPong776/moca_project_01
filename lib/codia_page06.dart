import 'dart:math'; // เพิ่มการใช้งาน Random
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'correct_answer_provider.dart'; // นำเข้า CorrectAnswerProvider
import 'codia_page07.dart';
import 'package:collection/collection.dart';

class CodiaPage06 extends StatefulWidget {
  const CodiaPage06({super.key});

  @override
  State<CodiaPage06> createState() => _CodiaPageState06();
}

class _CodiaPageState06 extends State<CodiaPage06> {
  List<String> selectedWords = []; // ตัวแปรเก็บคำที่ผู้ใช้เลือก
  String feedbackMessage = ''; // ตัวแปรเก็บข้อความแสดงผล

  // ชุดคำตอบที่มีให้สุ่ม
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

  late List<String> correctAnswers; // คำตอบที่สุ่มได้

  @override
  void initState() {
    super.initState();
    _randomizeAnswers(); // สุ่มชุดคำตอบเมื่อหน้าถูกโหลด
  }

  // ฟังก์ชันสุ่มชุดคำตอบ
  void _randomizeAnswers() {
    final random = Random();
    correctAnswers = answerSets[random.nextInt(answerSets.length)];
    // ใช้ Provider เพื่อส่งข้อมูล correctAnswer ไปยัง CodiaPage07 และ CodiaPage12
    Provider.of<CorrectAnswerProvider>(context, listen: false)
        .updateCorrectAnswer(correctAnswers);
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
                          'จงฟังเสียงอ่านคำทดสอบ 5 คำ \n และให้ผู้ทดสอบเลือกตามลำดับคำอ่านที่ได้ยิน',
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
                      ElevatedButton.icon(
                        onPressed: () {
                          // Action for "ฟังเสียงคำอ่าน"
                        },
                        icon: const Icon(Icons.volume_up),
                        label: const Text(
                          'ฟังเสียงคำอ่าน',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Display selected words (Below "ฟังเสียงคำอ่าน" button)
                      if (selectedWords.isNotEmpty) ...[
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: selectedWords
                              .map((word) => Chip(
                                    label: Text(word),
                                    // backgroundColor: Colors.purple,
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                                  ))
                              .toList(),
                        ),
                      ],
                      const SizedBox(height: 20),

                      // Display answer choices (buttons for word selection)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                              (index) => _buildAnimalButton(['หน้า', 'ผ้าไหม', 'วัด', 'มะลิ'][index]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                              (index) => _buildAnimalButton(['สีแดง', 'เสือ', 'บ้าน', 'หนังสือ'][index]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                              (index) => _buildAnimalButton(['ทีวี', 'ตา', 'สีเหลือง', 'วิทยุ'][index]),
                        ),
                      ),
                      const SizedBox(height: 30),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 16),
                        ),
                        onPressed: () {
                          setState(() {
                            if (selectedWords.isNotEmpty) {
                              selectedWords.removeLast(); // ลบคำสุดท้ายในลิสต์
                            }
                          });
                        },
                        child: const Text(
                          'ลบ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Feedback Message
              Positioned(
                bottom: 120,
                left: 64,
                child: Text(
                  feedbackMessage, // แสดงข้อความเช็คคำตอบ
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: feedbackMessage == 'คำตอบถูกต้อง!' ? Colors.green : Colors.red,
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

  // Widget สำหรับปุ่มคำตอบ
  Widget _buildAnimalButton(String label) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedWords.add(label); // เพิ่มคำที่เลือกเข้าไปในลิสต์
            if (selectedWords.length == 5) {
              // ตรวจสอบคำตอบเมื่อเลือกครบ 5 คำ
              _checkAnswer();
            }
          });
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  // ฟังก์ชันตรวจสอบคำตอบ
  void _checkAnswer() {
    if (selectedWords.length == 5) {
      final correctAnswer = Provider.of<CorrectAnswerProvider>(context, listen: false).correctAnswer;
      if (ListEquality().equals(selectedWords, correctAnswer)) {
        setState(() {
          feedbackMessage = 'คำตอบถูกต้อง!';
        });
        _showDialog('คำตอบถูกต้อง!', Colors.green);
      } else {
        setState(() {
          feedbackMessage = 'คำตอบไม่ถูกต้อง';
        });
        _showDialog('คำตอบไม่ถูกต้อง', Colors.red);
      }
      // รีเซ็ตคำตอบหลังจากเช็ค
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          selectedWords.clear(); // เคลียร์คำที่เลือก
          feedbackMessage = ''; // รีเซ็ตข้อความ
        });
      });
    }
  }

  // ฟังก์ชันแสดงการแจ้งเตือน
  void _showDialog(String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message, style: TextStyle(color: color)),
          actions: <Widget>[
            TextButton(
              child: const Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Widget สำหรับปุ่ม Footer
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
          // หากกดปุ่ม 'ออก' กลับไปหน้าหลัก
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage(), // หน้าหลัก (CodiaPage01)
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          // หากกดปุ่ม 'ข้อต่อไป' ไปยังหน้าถัดไป
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage07(), // หน้าถัดไป (CodiaPage07)
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
