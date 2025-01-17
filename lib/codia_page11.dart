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
  double buttonpaddings = 18;

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
    // Logic to handle submitted input
    print("Submitted input: $input");
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
                      'จงลบตัวเลขจาก 90 ลบออกทีละ 7 \nจำนวน 5 ครั้ง',
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    
                      // Display Numbers
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('90',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 126, 126, 126))),
                            Text('83',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                            Text('76',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                            Text('69',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                            Text('72',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                            Text('55',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),        
                          ],
                        ),
                      ),

                      // Number Pad Section
                      const SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Left Column
                          Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(
                                    buttonpaddings), // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('1'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('1',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('4'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('4',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('7'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('7',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: _submitInput,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('ok',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),

                          // Middle Column
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('2'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('2',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('5'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('5',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('8'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('8',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('0'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('0',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),

                          // Right Column
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('3'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('3',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('6'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('6',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: () => _addNumber('9'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('9',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    buttonpaddings),  // เพิ่มระยะห่างรอบปุ่ม
                                child: ElevatedButton(
                                  onPressed: _deleteLastNumber,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  child: const Text('ลบ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ],
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
              builder: (context) =>
                  const CodiaPage12(), // หน้าถัดไป (CodiaPage04)
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
