import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page11.dart';

class CodiaPage10 extends StatefulWidget {
  const CodiaPage10({super.key});

  @override
  State<CodiaPage10> createState() => _CodiaPageState10();
}

class _CodiaPageState10 extends State<CodiaPage10> {
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
                      
                      const SizedBox(height: 5),
                     // Display Numbers
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('00:30',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),  
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('1',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),  
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 26),
                        ),
                        onPressed: () {
                          // Action for the delete button
                        },
                        child: const Text(
                          'คลิก',
                          style: TextStyle(fontSize: 30, color: Colors.white),
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
            builder: (context) => const CodiaPage(), // หน้าหลัก (CodiaPage01)
          ),
        );
      } else if (text == 'ข้อต่อไป') {
        // หากกดปุ่ม 'ข้อต่อไป' ไปยังหน้าถัดไป
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CodiaPage11(), // หน้าถัดไป (CodiaPage04)
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