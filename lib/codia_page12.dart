import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page.dart';
import 'package:codia_demo_flutter/codia_page13.dart';

class CodiaPage12 extends StatefulWidget {
  const CodiaPage12({super.key});

  @override
  State<CodiaPage12> createState() => _CodiaPageState12();
}

class _CodiaPageState12 extends State<CodiaPage12> {
  int incorrectGuesses = 0;
  bool buttonsDisabled = false;
  String feedbackMessage = ''; // Variable to store feedback message

  // Correct answer
  final List<String> correctAnswer = [
    'หน้า ผ้าไหม วัด มะลิ สีแดง', // Correct answer in this order
  ];

  // List of options (all buttons)
  final List<String> options = [
    'มะลิ หน้า วิทยุ สีแดง ผ้าไหม',
    'หน้า ผ้าไหม วัด มะลิ สีแดง', // Correct answer
    'สีเหลือง หน้า ผ้าไหม วัด มะลิ',
    'ทีวี ตา วัด ผ้าไหม สีแดง',
    'เสื้อ บ้าน หนังสือ วัด ผ้าไหม',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1366,
          height: 1024,
          decoration: const BoxDecoration(
            color: Color(0xffe5f5f8), // Light blue background
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
                      // Answer options
                      ...List.generate(options.length, (index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildAnimalButton(options[index]),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }),

                      const SizedBox(height: 16),

                      // Incorrect guesses display
                      Text(
                        'จำนวนที่ทายผิด: $incorrectGuesses/2',
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      const SizedBox(height: 16),

                      // Feedback message (ถูกหรือผิด)
                      if (feedbackMessage.isNotEmpty)
                        Text(
                          feedbackMessage,
                          style: TextStyle(
                            fontSize: 22,
                            color: feedbackMessage == ''
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      const SizedBox(height: 30),
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

  // Widget for the answer buttons
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
      onPressed: buttonsDisabled
          ? null
          : () {
              if (incorrectGuesses < 2) {
                if (label == correctAnswer[0]) {
                  _showDialog("บันทึกคำตอบแล้ว", "กรุณากดปุ่ม \"ข้อต่อไป\" เพื่อทำแบบทดสอบข้อต่อไป🎉");
                  setState(() {
                    feedbackMessage = ''; // Correct answer message
                    buttonsDisabled = true; // Disable all buttons
                  });
                } else {
                  setState(() {
                    incorrectGuesses++;
                    feedbackMessage = ''; // Incorrect answer message
                  });

                  // Check if incorrect guesses have reached 2
                  if (incorrectGuesses >= 2) {
                    // Show dialog after 2 incorrect guesses
                    _showDialog("บันทึกคำตอบแล้ว", "กรุณากดปุ่ม \"ข้อต่อไป\" เพื่อทำแบบทดสอบข้อต่อไป🎉");
                  }
                }
              }
            },
      child: Text(
        label,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    ),
  );
}


  // Function to show dialog
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
                Navigator.of(context).pop();
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  // Widget for Footer buttons
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
              builder: (context) => const CodiaPage13(),
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
