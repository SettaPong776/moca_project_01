import 'package:flutter/material.dart';
import 'package:codia_demo_flutter/codia_page01.dart';

class CodiaPage extends StatefulWidget {
  const CodiaPage({super.key});

  @override
  State<CodiaPage> createState() => _CodiaPageState();
}

class _CodiaPageState extends State<CodiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
           Positioned(
            top: 200, // Adjusted position
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'images/image1_3171330.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter, // Adjust the image alignment
            ),
          ),

          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header section
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff095d7e), Color(0xff14967f)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/image2_3171333.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'MoCA Check Assessment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'คัดกรองและประเมินความเสี่ยงโรคสมองเสื่อม',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      // Main button positioned over the image
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CodiaPage01(), // เปลี่ยนเป็น CodiaPage01
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
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                )
                    ],
                  ),
                ),
                // Spacer for spacing
                const Spacer(),

                // Footer
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff14967f),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFooterButton(
                        icon: Icons.info,
                        label: 'แนะนำการใช้งาน',
                      ),
                      _buildFooterButton(
                        icon: Icons.settings,
                        label: 'ตั้งค่า',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Footer button
  Widget _buildFooterButton({required IconData icon, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}