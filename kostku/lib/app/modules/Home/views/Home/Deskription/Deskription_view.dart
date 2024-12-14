import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kostku/app/routes/app_pages.dart';

class KosDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("BUDIKOST"),
            Text(
              "Kos Premium",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('assets/Kost1.jpg'), // Ganti dengan path gambar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kost Putri Murah Nyaman (Kamar A1)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.CHAT); // Fungsi yang ingin dipanggil saat ikon di-klik
                        },
                        child: Icon(Icons.chat_bubble_outline),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Deskripsi',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.REVIEW);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('Review'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 0, // Set this dynamically to reflect the selected tab
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOME); // Navigation to the Home page
          } else if (index == 1) {
            Get.toNamed(Routes.SETINGS); // Navigation to the Profile/Register page
          }
        },
      ),
    );
  }
}