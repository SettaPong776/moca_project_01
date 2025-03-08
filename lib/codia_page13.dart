import 'package:flutter/material.dart'; 
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page14.dart';
import 'dart:math'; // สำหรับสุ่มคำถาม
import 'package:collection/collection.dart';

class CodiaPage13 extends StatefulWidget {
  const CodiaPage13({super.key});

  @override
  State<CodiaPage13> createState() => _CodiaPageState13();
}

class _CodiaPageState13 extends State<CodiaPage13> {
  // ข้อมูลคำถามและคำตอบที่ถูกต้อง
  Map<String, List<String>> wordMap = {
    'ฉันรู้ว่าจอมเป็นคนเดียวที่มาช่วยงานวันนี้': [
      'ฉัน',
      'รู้',
      'ว่า',
      'จอม',
      'เป็น',
      'คนเดียว',
      'ที่',
      'มาช่วยงาน',
      'วันนี้'
    ],
    'แมวมักซ่อนตัวอยู่หลังเก้าอี้เมื่อมีหมาอยู่ในห้อง': [
      'แมว',
      'มัก',
      'ซ่อนตัว',
      'อยู่',
      'หลัง',
      'เก้าอี้',
      'เมื่อ',
      'มี',
      'หมา',
      'อยู่',
      'ใน',
      'ห้อง'
    ],
    'เขารีบกลับบ้านทันทีที่ฝนเริ่มตกหนัก ': [
      'เขา',
      'รีบ',
      'กลับบ้าน',
      'ทันที',
      'ที่',
      'ฝน',
      'เริ่ม',
      'ตกหนัก'
    ],
    'เธอชอบดื่มกาแฟในตอนเช้าก่อนเริ่มทำงาน': [
      'เธอ',
      'ชอบ',
      'ดื่ม',
      'กาแฟ',
      'ใน',
      'ตอนเช้า',
      'ก่อน',
      'เริ่มทำงาน'
    ],
    'เธอวางแผนจะเรียนต่อในต่างประเทศหลังจบการศึกษา ': [
      'เธอ',
      'วางแผน',
      'จะ',
      'เรียนต่อ',
      'ใน',
      'ต่างประเทศ',
      'หลัง',
      'จบการศึกษา'
    ],
    'พวกเขาซื้อของใช้จำเป็นที่ตลาดเมื่อเช้านี้ ': [
      'พวกเขา',
      'ซื้อ',
      'ของใช้',
      'จำเป็น',
      'ที่',
      'ตลาด',
      'เมื่อ',
      'เช้านี้'
    ],
    'แมวของฉันชอบนอนบนเก้าอี้ตัวโปรดทุกวัน ': [
      'แมว',
      'ของ',
      'ฉัน',
      'ชอบ',
      'นอน',
      'บน',
      'เก้าอี้',
      'ตัวโปรด',
      'ทุกวัน'
    ],
    'พวกเราไปเดินเล่นที่สวนสาธารณะเมื่อวานนี้ ': [
      'พวกเรา',
      'ไป',
      'เดินเล่น',
      'ที่',
      'สวนสาธารณะ',
      'เมื่อวานนี้'
    ],
    'ทุกคนในครอบครัวชอบไปเที่ยวภูเขาในช่วงวันหยุดยาว': [
      'ทุกคน',
      'ใน',
      'ครอบครัว',
      'ชอบ',
      'ไป',
      'เที่ยว',
      'ภูเขา',
      'ในช่วง',
      'วันหยุดยาว'
    ],
    'ทุกคนต่างรอคอยวันที่จะได้พบกันอีกครั้ง ': [
      'ทุกคน',
      'ต่าง',
      'รอคอย',
      'วันที่',
      'จะ',
      'ได้',
      'พบกัน',
      'อีก',
      'ครั้ง'
    ],
  };

  // ตัวแปรเก็บคำตอบจากผู้ใช้ (ที่ผู้ใช้เลือกเรียงคำ)
  List<String> userAnswer = [];

  // ตัวแปรเก็บประโยคที่สุ่ม
  String currentQuestionKey = '';

  // สร้างตัวแปรเก็บคำในลำดับที่สุ่ม
  List<String> shuffledChoices = [];

  // ฟังก์ชันสำหรับสุ่มคำถาม
  void randomizeQuestion() {
    var random = Random();
    List<String> keys = wordMap.keys.toList();
    currentQuestionKey = keys[random.nextInt(keys.length)];

    // เก็บคำในลำดับที่สุ่ม
    shuffledChoices = List.from(wordMap[currentQuestionKey]!); 
    shuffledChoices.shuffle();  // สลับคำใน shuffledChoices ตอนเริ่มต้นเท่านั้น
  }

  // ฟังก์ชันสำหรับตรวจคำตอบ
  bool checkAnswer() {
    List<String> correctAnswer = List.from(wordMap[currentQuestionKey]!);
    return ListEquality().equals(userAnswer, correctAnswer); // ใช้ ListEquality เพื่อตรวจสอบความเท่ากันของ List
  }

  // ฟังก์ชันสำหรับลบคำใน list (ลบคำสุดท้าย)
  void removeLastWord() {
    setState(() {
      if (userAnswer.isNotEmpty) {
        userAnswer.removeLast(); // ลบคำสุดท้ายจาก userAnswer
      }
    });
  }

  // ฟังก์ชันสำหรับแสดง dialog
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // ปิด dialog
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    randomizeQuestion(); // เรียกสุ่มคำถามเมื่อเริ่มต้น
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 36,
                      ),
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
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff14967f),
                    borderRadius: BorderRadius.circular(57),
                  ),
                  child: const Center(
                    child: Text(
                      'จงฟังข้อความเสียงและเลือกกลุ่มคำตามข้อความเสียงให้ถูกต้อง',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24, // ปรับขนาดฟอนต์ใหญ่ขึ้น
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Main Content Section
              Positioned(
                top: 280,
                left: 64,
                right: 64,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xff000000), width: 1),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'คำถาม: $currentQuestionKey',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold), // ปรับขนาดฟอนต์
                      ),
                      const SizedBox(height: 16),
                      // แสดงคำที่เลือกเรียง
                      Text(
                        'คำที่เลือก: ${userAnswer.join(' ')}',
                        style: const TextStyle(fontSize: 24), // ปรับขนาดฟอนต์
                      ),
                      const SizedBox(height: 16),
                      // แสดงคำช้อยส์ที่สุ่มตำแหน่งในตอนเริ่มต้น
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: shuffledChoices.map((word) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.purple, // ตั้งสีปุ่มเป็นสีม่วง
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                // เพิ่มคำที่กดลงใน userAnswer
                                userAnswer.add(word);
                              });
                            },
                            child: Text(
                              word,
                              style: const TextStyle(
                                fontSize: 24, // ปรับขนาดฟอนต์ให้ใหญ่ขึ้น
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      

                      const SizedBox(height: 16),
                      // ปุ่มลบคำสุดท้ายจาก list
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 10, 10), // ตั้งสีปุ่มเป็นสีฟ้า
                          foregroundColor: Colors.white,
                        ),
                        onPressed: removeLastWord,
                        child: const Text(
                          'ลบคำล่าสุด',
                          style: TextStyle(
                            fontSize: 24, // ปรับขนาดฟอนต์ให้ใหญ่ขึ้น
                          ),
                        ),
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
              builder: (context) => const CodiaPage(),
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          // หากกดปุ่ม 'ข้อต่อไป'
          bool isCorrect = checkAnswer();
          print("คำตอบที่เลือก: ${userAnswer.join(' ')}");
          print(isCorrect ? "คำตอบถูกต้อง!" : "คำตอบผิด!");

          // แสดง dialog
          _showDialog(
            "บันทึกคำตอบแล้ว", 
            "กรุณากดปุ่ม 'ข้อต่อไป' เพื่อทำแบบทดสอบข้อต่อไป 🎉"
          );

          // รอให้ Dialog ปิดแล้วไปยังหน้าถัดไป
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CodiaPage14(),
              ),
            );
          });
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24, // ปรับขนาดฟอนต์ให้ใหญ่ขึ้น
          color: Colors.white,
        ),
      ),
    );
  }
}
