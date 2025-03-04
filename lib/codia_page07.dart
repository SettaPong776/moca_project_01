import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page08.dart';
import 'package:collection/collection.dart';

class CodiaPage07 extends StatefulWidget {
  const CodiaPage07({super.key});

  @override
  State<CodiaPage07> createState() => _CodiaPageState07();
}

class _CodiaPageState07 extends State<CodiaPage07> {
  List<String> selectedWords = []; // ตัวแปรเก็บคำที่ผู้ใช้เลือก
  String feedbackMessage = ''; // ตัวแปรเก็บข้อความแสดงผล

  // คำตอบที่ถูกต้อง
  final List<String> correctAnswers = ['หน้า', 'ผ้าไหม', 'วัด', 'มะลิ', 'สีแดง'];

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
                          'จงฟังเสียงอ่านคำทดสอบ 5 คำ \n และให้ผู้ทดสอบเลือกตามลำดับคำอ่านที่ได้ยิน ',
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
                      
                      
                      const SizedBox(height: 30),
                          Positioned(
                bottom: 80,
                left: 64,
                child: Text(
                  ' ${selectedWords.join('       ')}', // แสดงคำที่เลือกโดยใช้การเว้นวรรค
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
                      const SizedBox(height: 60),
                           // Display selected words
          
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
  Widget _buildCategoryLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

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
      if (ListEquality().equals(selectedWords, correctAnswers)) {
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
              builder: (context) => const CodiaPage08(), // หน้าถัดไป (CodiaPage07)
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
