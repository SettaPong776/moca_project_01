import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page02.dart';

class CodiaPage01 extends StatefulWidget {
  const CodiaPage01({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage01();
}

class _CodiaPage01 extends State<CodiaPage01> {
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
          
            Positioned(
              left: 0,
              width: 1366,
              top: 0,
              height: 272,
              child: Container(
                width: 1366,
                height: 272,
                decoration: const BoxDecoration(
                ),
              ),
            ),
            Positioned(
              left: 2,
              width: 1366,
              top: 1207,
              height: 161,
              child: Container(
                width: 1366,
                height: 161,
                decoration: const BoxDecoration(
                  color: Color(0xff14967f),
                  boxShadow: [BoxShadow(color: Color(0x3f000000), offset: Offset(0, 4), blurRadius: 32.9),],
                ),
              ),
            ),
            const Positioned(
              left: 96,
              width: 216,
              top: 371,
              height: 48,
              child: Text(
                'ลงทะเบียน',
                textAlign: TextAlign.left,
                style: TextStyle(decoration: TextDecoration.none, fontSize: 48, color: Color(0xff000000), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              left: 597,
              width: 295,
              top: 542,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            'สถานที่ขณะทำการทดสอบ',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffb218b0), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'สถานีอนามัย',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff1f2024), fontWeight: FontWeight.normal),
                                                  maxLines: 9999,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 137,
              width: 295,
              top: 437,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            'ชื่อ-นามสกุล',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffb217af), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'John Doe',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff1f2024), fontWeight: FontWeight.normal),
                                                  maxLines: 9999,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 137,
              width: 295,
              top: 542,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            'จังหวัดที่อยู่ปัจจุบัน',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffb218b0), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ปราจีนบุรี',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff1f2024), fontWeight: FontWeight.normal),
                                                  maxLines: 9999,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Image.asset('images/image_I31712663171551.png', width: 12, height: 12,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 597,
              width: 295,
              top: 437,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            'ระดับการศึกษา',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffb218b0), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ปริญญาตรี',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff1f2024), fontWeight: FontWeight.normal),
                                                  maxLines: 9999,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Image.asset('images/image_I31712673171551.png', width: 12, height: 12,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 137,
              width: 295,
              top: 702,
              height: 48,
              child: Container(
                width: 295,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffb218b0), width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'วว/ดด/ปปปป',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Color(0xff1f2024), fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset('images/image_350720.png', width: 12, height: 12,),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 597,
              width: 169,
              top: 647,
              height: 62,
              child: Container(
                width: 169,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      width: 42,
                      top: 0,
                      height: 22,
                      child: Text(
                        'เพศ',
                        textAlign: TextAlign.left,
                        style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Positioned(
                      left: 40,
                      width: 38,
                      top: 38,
                      height: 22,
                      child: Text(
                        'ชาย',
                        textAlign: TextAlign.left,
                        style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Positioned(
                      left: 122,
                      width: 48,
                      top: 38,
                      height: 22,
                      child: Text(
                        'หญิง',
                        textAlign: TextAlign.left,
                        style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff000000), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Positioned(
                      left: 3,
                      width: 24,
                      top: 38,
                      height: 24,
                      child: Image.asset('images/image_3171272.png', width: 24, height: 24,),
                    ),
                    Positioned(
                      left: 85,
                      width: 24,
                      top: 38,
                      height: 24,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff000000), width: 2),
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 137,
              width: 63,
              top: 664,
              height: 29,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'วันเกิด',
                      textAlign: TextAlign.left,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xff060303), fontFamily: 'Inter-Medium', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
           
            // Footer
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
                    const SizedBox(width: 10),
                    const Text(
                      'หน้าหลัก',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      left: 22,
                      width: 64,
                      top: 0,
                      height: 64,
                      child: Image.asset('images/image_I31712843171401.png', width: 64, height: 64,),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 91,
              width: 842,
              top: 1078,
              height: 67,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 842,
                    top: 0,
                    height: 67,
                    child: Container(
                      
                      width: 842,
                      height: 67,
                      decoration: BoxDecoration(
                        color: const Color(0xffb217af),
                        borderRadius: BorderRadius.circular(19),
                        boxShadow: const [BoxShadow(color: Color(0x3f000000), offset: Offset(0, 15), blurRadius: 23),],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CodiaPage02(), // เปลี่ยนเป็น CodiaPage02
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
                      child: const Center( // ใช้ Center เพื่อจัดข้อความให้อยู่ตรงกลาง
                        child: Text(
                          'ทำแบบประเมิน',
                          textAlign: TextAlign.center, // จัดข้อความให้อยู่ตรงกลางแนวตั้ง
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
