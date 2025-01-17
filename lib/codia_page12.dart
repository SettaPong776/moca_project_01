import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page13.dart';

class CodiaPage12 extends StatefulWidget {
  const CodiaPage12({super.key});

  @override
  State<CodiaPage12> createState() => _CodiaPageState12();
}

class _CodiaPageState12 extends State<CodiaPage12> {
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
                          'จงเลือกคำให้ถูกต้องตามลำดับคำอ่านที่ได้ยินจากครั้งที่แล้ว',
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
                top: 310,
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
                      
                      const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              1,
                              (index) => _buildAnimalButton(['มะลิ หน้า วิทยุ สีแดง ผ้าไหม'][index]),
                            ),
                          ),
                      
                      const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              1,
                              (index) => _buildAnimalButton(['หน้า ผ้าไหม วัด มะลิ สีแดง'][index]),
                            ),
                          ),
                       const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              1,
                              (index) => _buildAnimalButton(['สีเหลือง หน้า ผ้าไหม วัด มะลิ'][index]),
                            ),
                          ),
                      
                      const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              1,
                              (index) => _buildAnimalButton(['ทีวี ตา วัด ผ้าไหม สีแดง'][index]),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              1,
                              (index) => _buildAnimalButton(['เสื้อ บ้าน หนังสือ วัด ผ้าไหม'][index]),
                            ),
                          ),
                      const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end, // จัดตำแหน่งปุ่มให้อยู่ทางขวา
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                  ),
                                  onPressed: () {
                                    // Action for the delete button
                                  },
                                  child: const Text(
                                    'จำนวนที่ทายผิด 2/2',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
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

  // Widget สำหรับปุ่มคำตอบ
  // ignore: unused_element
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
      width: 350,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 61, 122, 253),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        onPressed: () {
          // Action for animal button
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 22, color: Colors.white),
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
            builder: (context) => const CodiaPage13(), // หน้าถัดไป (CodiaPage04)
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
