import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page14.dart';
import 'package:collection/collection.dart';

class CodiaPage13 extends StatefulWidget {
  const CodiaPage13({super.key});

  @override
  State<CodiaPage13> createState() => _CodiaPageState13();
}

class _CodiaPageState13 extends State<CodiaPage13> {
  Map<String, dynamic>? wordData;
  List<String> selectedWords = [];
  List<String> correctAnswers = [];
  List<String> currentSentence = [];
  String sentenceWithBlanks = "____ มักซ่อนตัวอยู่หลัง ____ เมื่อมี ____ อยู่ในห้อง";

  @override
  void initState() {
    super.initState();
    loadJsonData().then((data) {
      setState(() {
        wordData = data;
        correctAnswers = List<String>.from(wordData!['correctAnswers']);
        currentSentence = List<String>.from(wordData!['correctAnswers']);
      });
    });
  }

  // ฟังก์ชันโหลดข้อมูลจากไฟล์ 13.json
  Future<Map<String, dynamic>> loadJsonData() async {
    String jsonString = await rootBundle.rootBundle.loadString('lib/json/13.json');
    return jsonDecode(jsonString);
  }

  // ฟังก์ชันแสดงปุ่มคำ
  Widget _buildWordButton(String word) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (selectedWords.contains(word)) {
              selectedWords.remove(word);
            } else {
              selectedWords.add(word);
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Text(
          word,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }

  // ฟังก์ชันตรวจคำตอบ
  void _checkAnswer() {
    // เปรียบเทียบคำตอบที่ผู้ใช้เรียงกับคำตอบที่ถูกต้อง
    if (ListEquality().equals(selectedWords, correctAnswers)) {
      _showDialog('ถูกต้อง!', 'คำตอบของคุณถูกต้อง 🎉');
    } else {
      _showDialog('ผิดพลาด', 'กรุณาลองใหม่ ❌');
    }
  }

  // แสดง Dialog ผลลัพธ์
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
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันสำหรับปุ่ม Footer
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
              builder: (context) => const CodiaPage(),
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CodiaPage14(),
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
        child: wordData == null
            ? const CircularProgressIndicator() // แสดงการโหลดข้อมูล
            : Container(
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
                                'จงฟังข้อความเสียงและเลือกกลุ่มคำตาม\nข้อความเสียงให้ถูกต้อง',
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
                            Text(
                              sentenceWithBlanks, // แสดงประโยคที่มีช่องว่าง
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 30),
                            // Display the categories dynamically
                            for (var category in wordData!['categories'])
                              Column(
                                children: [
                                  Text(
                                    category['name'],
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                      category['words'].length,
                                          (index) => _buildWordButton(category['words'][index]),
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _checkAnswer,
                              child: const Text('ตรวจคำตอบ'),
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
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
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
