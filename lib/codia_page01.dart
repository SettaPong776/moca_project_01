import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page02.dart';

class CodiaPage01 extends StatefulWidget {
  const CodiaPage01({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage01();
}

class _CodiaPage01 extends State<CodiaPage01> {
  // ตัวแปรสำหรับจัดการ Dropdown
  String? selectedEducation; // ระดับการศึกษา
  String? selectedProvince; // จังหวัด
  String? testLocation; // สถานที่ทำแบบทดสอบ
  String selectedGender = "ชาย"; // เพศ (ค่าเริ่มต้น)

  // รายการตัวเลือกสำหรับ Dropdown
  final List<String> educationLevels = ["ประถมศึกษา", "มัธยมศึกษา", "ปริญญาตรี", "ปริญญาโท", "ปริญญาเอก"];
  final List<String> provinces = [
    "กรุงเทพมหานคร", "กระบี่", "กาญจนบุรี", "กาฬสินธุ์", "กำแพงเพชร", "ขอนแก่น", "จันทบุรี", "ฉะเชิงเทรา", "ชลบุรี", "ชัยนาท",
    "ชัยภูมิ", "ชุมพร", "เชียงราย", "เชียงใหม่", "ตรัง", "ตราด", "ตาก", "นครนายก", "นครปฐม", "นครพนม", "นครราชสีมา", "นครศรีธรรมราช",
    "นครสวรรค์", "นนทบุรี", "นราธิวาส", "น่าน", "บึงกาฬ", "บุรีรัมย์", "ปทุมธานี", "ประจวบคีรีขันธ์", "ปราจีนบุรี", "ปัตตานี", "พระนครศรีอยุธยา",
    "พะเยา", "พังงา", "พัทลุง", "พิจิตร", "พิษณุโลก", "เพชรบุรี", "เพชรบูรณ์", "แพร่", "ภูเก็ต", "มหาสารคาม", "มุกดาหาร", "แม่ฮ่องสอน",
    "ยโสธร", "ยะลา", "ร้อยเอ็ด", "ระนอง", "ระยอง", "ราชบุรี", "ลพบุรี", "ลำปาง", "ลำพูน", "เลย", "ศรีสะเกษ", "สกลนคร", "สงขลา",
    "สตูล", "สมุทรปราการ", "สมุทรสงคราม", "สมุทรสาคร", "สระแก้ว", "สระบุรี", "สิงห์บุรี", "สุโขทัย", "สุพรรณบุรี", "สุราษฎร์ธานี", "สุรินทร์",
    "หนองคาย", "หนองบัวลำภู", "อ่างทอง", "อำนาจเจริญ", "อุดรธานี", "อุตรดิตถ์", "อุทัยธานี", "อุบลราชธานี"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1366,
        height: 1024,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff14967f), Color(0xffe5f5f8)], // สีพื้นหลังแบบไล่สี
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Header Section
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 1366,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xff14967f), // สีเขียวเข้ม
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/image_3171278.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(width: 60),
                    const Text(
                      'MoCA Check \nAssessment',
                      style: TextStyle(
                        fontSize: 64,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Center Form Section
            Center(
              child: Container(
                width: 800,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff), // สีพื้นหลังของฟอร์ม
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 32.9,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ลงทะเบียน',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ชื่อ-นามสกุล',
                                style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'กรอกชื่อ-นามสกุล',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'จังหวัดที่อยู่ปัจจุบัน',
                                style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                              ),
                              const SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: selectedProvince,
                                items: provinces.map((String province) {
                                  return DropdownMenuItem<String>(
                                    value: province,
                                    child: Text(province),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedProvince = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'เลือกจังหวัด',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'เพศ',
                                style: TextStyle(fontSize: 25, color: Color(0xff000000)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: "ชาย",
                                        groupValue: selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                      const Text('ชาย'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "หญิง",
                                        groupValue: selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                      const Text('หญิง'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "LGBTQ+",
                                        groupValue: selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                      const Text('LGBTQ+'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ระดับการศึกษา',
                                style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                              ),
                              const SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: selectedEducation,
                                items: educationLevels.map((String level) {
                                  return DropdownMenuItem<String>(
                                    value: level,
                                    child: Text(level),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedEducation = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'เลือกระดับการศึกษา',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'วันเกิด',
                                style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'วว/ดด/ปปปป',
                                ),
                              ),
                              
                            
                            ],
                          ),
                        ),
                      ],
                    ),
                      // Button Section
                                         Column(
                                            children: [
                                              const SizedBox(height: 30), // เพิ่มระยะห่างด้านบนปุ่ม
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => const CodiaPage02(),
                                                      ),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: const Color(0xffb217af),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(19),
                                                    ),
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 16,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'ทำแบบประเมิน',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 30), // เพิ่มระยะห่างด้านล่างปุ่ม
                                            ],
                                          ),
                  ],
                ),
              ),
            ),

           

           // Footer Section
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xff14967f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // กลับไปหน้าที่ 1
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const CodiaPage()),
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.home, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                'หน้าหลัก',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
