import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kostku/app/routes/app_pages.dart';

class SetingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          // Header with Profile Image, Name, Email, Role
          Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "name",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Text(
                      "email",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    Text(
                      "pencari/pemilik",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Menu options
          Expanded(
            child: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.black),
                    title: Text("Edit Akun"),
                    onTap: () {
                      Get.toNamed(Routes.PROFILEEDIT); // Ganti dengan route yang sesuai
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.black),
                    title: Text("Ubah Password"),
                    onTap: () {
                      Get.toNamed(Routes.PASWORDEDIT); // Ganti dengan route yang sesuai
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.black),
                    title: Text("Logout"),
                    onTap: () {
                      // Tambahkan logika logout atau navigasi ke halaman login
                      Get.toNamed(Routes.LOGIN); // Ganti dengan route yang sesuai
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.black),
                    title: Text("Edit Kamar"),
                    onTap: () {
                      Get.toNamed(Routes.EDITKAMAR); // Ganti dengan route yang sesuai
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
