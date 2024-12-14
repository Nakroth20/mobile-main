import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kostku/app/routes/app_pages.dart';

class EditKamarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Edit Kamar"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Get.toNamed(Routes.TAMBAHKAMAR);// Add your onPressed code here!
              },
              child: const Text("Tambah kamar"),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                RoomItem(
                  roomName: "Kost Putri Murah Nyaman (Kamar A1)",
                  onEdit: () {
                    Get.toNamed(Routes.EDITKAMAREDIT);// Handle edit action
                  },
                  onDelete: () {
                    // Handle delete action
                  },
                ),
                RoomItem(
                  roomName: "Kost Putri Murah Nyaman (Kamar A2)",
                  onEdit: () {
                    // Handle edit action
                  },
                  onDelete: () {
                    // Handle delete action
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Text("Daftar"),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomItem extends StatelessWidget {
  final String roomName;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RoomItem({
    Key? key,
    required this.roomName,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                roomName,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
