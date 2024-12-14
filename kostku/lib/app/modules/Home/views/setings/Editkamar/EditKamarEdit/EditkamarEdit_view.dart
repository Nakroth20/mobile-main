import 'package:flutter/material.dart';

class EditKamarEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Edit kamar Kost Putri Murah Nyaman (Kamar A1)"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Room image with camera icon overlay
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/room_image.jpg'), // Placeholder image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6), // Dark background for better visibility
                      shape: BoxShape.circle, // Circle shape
                    ),
                    padding: const EdgeInsets.all(8), // Padding inside the circle
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                      onPressed: () {
                        // Handle image capture or selection
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Room name input
            TextField(
              decoration: InputDecoration(
                labelText: "Nama kamar",
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
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
