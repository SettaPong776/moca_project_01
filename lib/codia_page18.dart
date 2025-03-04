import 'dart:math'; // สำหรับการสุ่มคำถาม
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page15.dart';
import 'package:flutter/material.dart';

class CodiaPage18 extends StatefulWidget {
  const CodiaPage18({super.key});

  @override
  State<CodiaPage18> createState() => _CodiaPageState18CodiaPage18();
}

class _CodiaPageState18CodiaPage18 extends State<CodiaPage18> {
  List<String> questions = [];
  List<String> answers = [];
  String _selectedCategoryName = ''; // ตัวแปรสำหรับเก็บหมวดหมู่ที่สุ่ม

  // ข้อมูลหมวดหมู่
  final List<Map<String, dynamic>> categories = [
    {
      "id": 1,
      "name": "ยานพาหนะ",
      "words": [
        "รถมอเตอร์ไซค์", "รถจักรยาน", "รถยนต์", "รถบรรทุก", "รถไฟ", "เครื่องบิน", "เรือ"
      ]
    },
    {
      "id": 2,
      "name": "สัตว์",
      "words": ["แมว", "สุนัข", "นก", "ปลา", "ช้าง", "ผีเสื้อ", "ไก่"]
    },
    {
      "id": 3,
      "name": "ผลไม้",
      "words": ["ทุเรียน", "มะม่วง", "กล้วย", "มะละกอ", "แอปเปิ้ล", "องุ่น", "ส้ม"]
    },
    {
      "id": 4,
      "name": "เครื่องเขียน",
      "words": ["ปากกา", "ไม้บรรทัด", "ยางลบ", "สมุด", "ดินสอ", "กรรไกร", "กาว"]
    },
    {
      "id": 5,
      "name": "เครื่องแต่งกาย",
      "words": ["เสื้อ", "กางเกง", "กระโปรง", "รองเท้า", "กระเป๋า", "ถุงเท้า", "นาฬิกา"]
    },
    {
      "id": 6,
      "name": "อาหาร",
      "words": ["ข้าว", "ไข่ดาว", "ขนมปัง", "นม", "เนย", "ขนม", "เค้ก", "น้ำปั่น"]
    }
  ];

  @override
  void initState() {
    super.initState();
    _loadQuestions(); // เรียกฟังก์ชันโหลดคำถาม
  }

  // ฟังก์ชันสำหรับสุ่มคำถามจากหมวดหมู่
  Future<void> _loadQuestions() async {
    final random = Random();
    final category = categories[random.nextInt(categories.length)];

    // เลือก 2 คำจากหมวดหมู่ที่สุ่ม
    final words = category['words'];
    final selectedWords = _getRandomWords(words, 2); // สุ่มคำ 2 คำ

    setState(() {
      questions = selectedWords; // เพิ่มคำถามที่สุ่ม
      answers = List.generate(6, (index) => categories[index]['name']); // ใช้ชื่อหมวดหมู่แทน
      _selectedCategoryName = category['name']; // บันทึกชื่อหมวดหมู่ที่สุ่ม
    });
  }

  // ฟังก์ชันสุ่มคำ 2 คำจาก list ของคำ
  List<String> _getRandomWords(List<String> words, int count) {
    final random = Random();
    Set<String> selectedWords = {};
    while (selectedWords.length < count) {
      selectedWords.add(words[random.nextInt(words.length)]);
    }
    return selectedWords.toList();
  }

  // ฟังก์ชันตรวจสอบคำตอบ
  void _checkAnswer(String selectedCategory) {
    if (selectedCategory == _selectedCategoryName) {
      print("เลือกหมวดหมู่ถูกต้อง: $selectedCategory");
    } else {
      print("เลือกหมวดหมู่ผิด: $selectedCategory");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,  // ใช้ขนาดที่ยืดหยุ่น
          height: double.infinity, // ใช้ขนาดที่ยืดหยุ่น
          decoration: const BoxDecoration(
            color: Color(0xffe5f5f8), // พื้นหลังสีฟ้าอ่อน
          ),
          child: Stack(
            children: [
              // Header Section
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
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
                          'จงเลือกหมวดหมู่ที่สอดคล้องกับ\nข้อความที่ปราฏบนหน้าจอ ',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // แสดงคำถามที่สุ่ม 2 คำ
                          Text(
                            questions.isNotEmpty ? '${questions[0]} และ ${questions[1]}' : 'กำลังโหลดคำถาม...',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      // แสดงคำตอบ
                      GridView.builder(
                      shrinkWrap: true,  // ใช้เพื่อให้ GridView ไม่ขยายไปเต็มพื้นที่
                      physics: const NeverScrollableScrollPhysics(),  // ปิดการเลื่อนในกรณีที่ไม่ต้องการ
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,  // กำหนดให้มี 2 คอลัมน์
                        crossAxisSpacing: 16, // ระยะห่างระหว่างคอลัมน์
                        mainAxisSpacing: 16, // ระยะห่างระหว่างแถว
                        childAspectRatio: 8, // ปรับอัตราส่วนของแต่ละปุ่ม (กำหนดความกว้างให้ยาวกว่าความสูง)
                      ),
                      itemCount: answers.length,
                      itemBuilder: (context, index) {
                        return _buildAnswer(answers[index]);  // ใช้ฟังก์ชัน _buildAnswer ในการสร้างปุ่ม
                      },
                    ),
                    ],
                  ),
                ),
              ),
              
              // Footer Section
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height:100,
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

  // Widget สำหรับปุ่มคำตอบ
  Widget _buildAnswer(String label) {
    return SizedBox(
      width: 120,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        onPressed: () {
          // ตรวจสอบคำตอบเมื่อกดปุ่ม
          _checkAnswer(label);
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
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
              builder: (context) => const CodiaPage15(), // หน้าถัดไป (CodiaPage08)
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
