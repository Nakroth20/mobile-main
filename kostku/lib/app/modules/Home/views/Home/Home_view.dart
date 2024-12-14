import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kostku/app/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'BUDIKOST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: [SizedBox(width: 48)], // Placeholder to center title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Membuat body bisa discroll
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kos Premium',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              GridView.count(
                shrinkWrap: true,  // Mengatur GridView agar sesuai dengan ukuran konten
                physics: NeverScrollableScrollPhysics(),  // Menonaktifkan scroll pada GridView karena sudah menggunakan SingleChildScrollView
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail kos dengan Get.toNamed
                      Get.toNamed('/deskripsi', arguments: {
                        'imageUrl': 'assets/kost2.jpg',
                        'title': 'Kost Putri Murah Nyaman (Kamar A2)',
                        'address': 'Jl. Ar-Royan I, RT.001/RW.002, Jatiwaringin, Kcc...',
                        'price': 'Rp450.000 / bln',
                        'status': 'Terisi',
                        'statusColor': Colors.green,
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),  // Padding untuk setiap kartu kos
                      child: _buildKosCard(
                        imageUrl: 'assets/Kost2.jpg', // Gambar kartu kos
                        title: 'Kost Putri Murah Nyaman (Kamar A2)',
                        address: 'Jl. Ar-Royan I, RT.001/RW.002, Jatiwaringin, Kcc...',
                        price: 'Rp450.000 / bln',
                        status: 'Terisi',
                        statusColor: Colors.red,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail kos dengan Get.toNamed
                      Get.toNamed('/deskripsi', arguments: {
                        'imageUrl': 'assets/kost2.jpg',
                        'title': 'Kost Putri Murah Nyaman (Kamar A1)',
                        'address': 'Jl. Ar-Royan I, RT.001/RW.002, Jatiwaringin, Kcc...',
                        'price': 'Rp600.000 / bln',
                        'status': 'Ada Kosong',
                        'statusColor': Colors.green,
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),  // Padding untuk setiap kartu kos
                      child: _buildKosCard(
                        imageUrl: 'assets/kost1.jpg',
                        title: 'Kost Putri Murah Nyaman (Kamar A1)',
                        address: 'Jl. Ar-Royan I, RT.001/RW.002, Jatiwaringin, Kcc...',
                        price: 'Rp600.000 / bln',
                        status: 'Ada Kosong',
                        statusColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  Widget _buildKosCard({
    required String imageUrl,
    required String title,
    required String address,
    required String price,
    required String status,
    required Color statusColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Mulai',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}