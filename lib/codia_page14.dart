import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page15.dart';

class CodiaPage14 extends StatefulWidget {
  const CodiaPage14({super.key});

  @override
  State<CodiaPage14> createState() => _CodiaPageState14();
}

class _CodiaPageState14 extends State<CodiaPage14> {
  final Map<String, List<String>> wordMap = {
    'กาน้ำร้อน': ['ก'],
    'กาแฟ': ['ก'],
    'กระเป๋า': ['ก'],
    'กระดาษ': ['ก'],
    'กลอง': ['ก'],
    'เก้าอี้': ['ก'],
    'กางเกง': ['ก'],
    'กระโปรง': ['ก'],
    'กุหลาบ': ['ก'],
    'กล้วย': ['ก'],
    'กล้อง': ['ก'],
    'แกง': ['ก'],
    'แก้ว': ['ก'],
    'กะหล่ำปลี': ['ก'],
    'ขนม': ['ข'],
    'ขวด': ['ข'],
    'ข้าว': ['ข'],
    'ขนมปัง': ['ข'],
    'ข้าวต้ม': ['ข'],
    'ข้าวผัด': ['ข'],
    'ขนมจีบ': ['ข'],
    'ข้าวเหนียว': ['ข'],
    'ขา': ['ข'],
    'ขาว': ['ข'],
    'ขนมเค้ก': ['ข'],
    'ขี้เถ้า': ['ข'],
    'คอมพิวเตอร์': ['ค'],
    'คาเฟ่': ['ค'],
    'เครื่องปั่น': ['ค'],
    'คีย์บอร์ด': ['ค'],
    'ครีม': ['ค'],
    'คณิตศาสตร์': ['ค'],
    'ควัน': ['ค'],
    'ค่าย': ['ค'],
    'ข้าวโพด': ['ค'],
    'ความรัก': ['ค'],
    'คมนาคม': ['ค'],
    'ความโศก': ['ค'],
    'คุก': ['ค'],
    'คะน้า': ['ค'],
    'งู': ['ง'],
    'ง่วง': ['ง'],
    'งาม': ['ง'],
    'งบประมาณ': ['ง'],
    'จันทร์': ['จ'],
    'จอ': ['จ'],
    'จาน': ['จ'],
    'จิ้ม': ['จ'],
    'จ่าย': ['จ'],
    'จอมปลวก': ['จ'],
    'เจล': ['จ'],
    'เจ้านาย': ['จ'],
    'จรวด': ['จ'],
    'รถยนต์': ['ร'],
    'โรงเรียน': ['ร'],
    'ร่ม': ['ร'],
    'รองเท้า': ['ร'],
    'เรือ': ['ร'],
    'รัง': ['ร'],
    'รอยยิ้ม': ['ร'],
    'ร่างกาย': ['ร'],
    'ราก': ['ร'],
    'รังสิต': ['ร'],
    'ลิฟต์': ['ล'],
    'ลวด': ['ล'],
    'ลำโพง': ['ล'],
    'ลบ': ['ล'],
    'ละออง': ['ล'],
    'ลูก': ['ล'],
    'ลำไย': ['ล'],
    'ลูกตุ้ม': ['ล'],
    'ยาง': ['ย'],
    'ยารักษาโรค': ['ย'],
    'ยำ': ['ย'],
    'ยานพาหนะ': ['ย'],
    'ยก': ['ย'],
    'ยอม': ['ย'],
    'ยิ้ม': ['ย'],
    'ยาน': ['ย'],
    'ยาว': ['ย'],
    'ย่อย': ['ย'],
    'ยืม': ['ย'],
    'ยุทธ': ['ย'],
    'ยี่ห้อ': ['ย'],
    'ยักษ์': ['ย'],
    'ยกเลิก': ['ย'],
    'โยกย้าย': ['ย'],
    'ยาก': ['ย'],
    'โยก': ['ย'],
    'ยินดี': ['ย'],
    'ยิ่ง': ['ย'],
    'ยุติธรรม': ['ย'],
    'ยั่งยืน': ['ย'],
    'ยิ่งยง': ['ย'],
    'ยืน': ['ย'],
    'ยิ่งใหญ่': ['ย'],
    'ยัก': ['ย'],
    'ยาย': ['ย'],
    'ยาวนาน': ['ย'],
    'ยุทธศาสตร์': ['ย'],
    'ยัด': ['ย'],
  };

  List<String> selectedLetters = []; // เก็บตัวอักษรที่สุ่ม
  List<String> selectedWordsDisplay = []; // เก็บคำที่สุ่มมาและแสดงผล
  String input = ''; // เก็บคำตอบที่ผู้ใช้กด
  String currentWord = ''; // คำที่กำลังแสดงให้ผู้ใช้เห็น
  final List<String> validStartingLetters = [
    'ก',
    'ข',
    'ค',
    'ง',
    'จ',
    'ร',
    'ล',
    'ย'
  ];
  final List<String> options = ['ก', 'ข', 'ค', 'ง', 'จ', 'ร', 'ล', 'ย'];

  // ตัวแปรสำหรับการเก็บสถานะการทำแบบทดสอบ
  bool isTestRunning = false;

  @override
  void initState() {
    super.initState();
    _selectRandomLetters();
  }

  void _selectRandomLetters() {
    Random random = Random();
    selectedLetters.clear();
    selectedWordsDisplay.clear();
    List<String> allWords = wordMap.keys
        .where((word) => validStartingLetters
            .contains(word[0])) // กรองคำที่ขึ้นต้นด้วยตัวอักษรที่กำหนด
        .toList();

    for (int i = 0; i < 5; i++) {
      String word = allWords[random.nextInt(allWords.length)];
      selectedLetters.add(word[0]); // เพิ่มตัวอักษรแรกของคำ
      selectedWordsDisplay.add(word); // เก็บคำที่สุ่มมา
    }
  }

  void _handleButtonPress(String buttonText) {
    setState(() {
      input += buttonText; // เพิ่มตัวอักษรที่ผู้ใช้กดลงในช่องแสดงผล
    });
  }

  void _checkAnswer() {
  String correctAnswer = selectedLetters.join('');
  
  // แสดงผลคำตอบที่กรอกและคำตอบที่ถูกต้องใน console
  print('คำตอบที่ผู้ใช้กรอก: $input');
  print('คำตอบที่ถูกต้อง: $correctAnswer');
  
  // ตรวจสอบคำตอบ
  if (input == correctAnswer) {
    print('ผลลัพธ์: คำตอบถูกต้อง 🎉');
  } else {
    print('ผลลัพธ์: คำตอบผิด ❌');
  }

  // รีเซ็ตคำตอบหลังจากตรวจสอบ
  setState(() {
    input = ''; // รีเซ็ตคำตอบหลังจากการตรวจสอบ
  });
}
  // ฟังก์ชันสำหรับเริ่มทำแบบทดสอบ
  void _startTest() async {
    setState(() {
      isTestRunning = true;
    });

    // เริ่มแสดงคำทีละคำโดยหน่วงเวลา 12 วินาที
    for (var word in selectedWordsDisplay) {
      setState(() {
        currentWord = word; // แสดงคำที่สุ่ม
      });

      await Future.delayed(Duration(seconds: 3)); // หน่วงเวลา 12 วินาที
    }

    setState(() {
      isTestRunning = false;
    });
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
                      'จงเลือกตัวอักษรขึ้นต้นจากคำศัพท์ที่ได้ยิน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
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
                      Text("คำที่สุ่ม: $currentWord"), // แสดงคำที่สุ่ม
                      const SizedBox(height: 20),
                      Text("คำตอบของคุณ: $input"),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: options.map((letter) {
                          return ElevatedButton(
                            onPressed: () => _handleButtonPress(letter),
                            child: Text(letter),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.purple,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _startTest, // เริ่มการทดสอบ
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("เริ่มทำแบบทดสอบ"
                        ,style: TextStyle(color: Colors.white)),
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
              builder: (context) => const CodiaPage(), // Navigate to CodiaPage
            ),
          );
        } else if (text == 'ข้อต่อไป') {
          _checkAnswer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CodiaPage15(), // Navigate to the next page
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
