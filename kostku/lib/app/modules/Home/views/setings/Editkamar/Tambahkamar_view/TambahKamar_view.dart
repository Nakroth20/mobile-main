import 'package:flutter/material.dart';

class TambahKamarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Tambah Kamar"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Room name input
            TextField(
              decoration: InputDecoration(
                labelText: "Nama Kamar",
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image upload button
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.camera_alt, size: 40),
                  onPressed: () {
                    // Handle image selection
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Room description input
            TextField(
              decoration: InputDecoration(
                labelText: "Deskripsi kamar",
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 4,
            ),
            Spacer(),
            // Register button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Handle register action
              },
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
