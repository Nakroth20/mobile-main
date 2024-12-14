import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("BUDIKOST"),
            Text(
              "Kost Putri Murah Nyaman (Kamar A1)",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Gambar kamar (Landscape mode, only height adjusts)
          Image.network(
            'assets/kost1.jpg', // Ganti dengan URL atau path gambar.
            width: double.infinity, // Make sure the width fills the screen
            height: 200, // Set the height of the image.
            fit: BoxFit.cover, // Maintain aspect ratio but crop the image
          ),
          Expanded(
            child: Container(
              color: Colors.green[100], // Latar belakang area chat.
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true, // Ensures ListView expands based on content size
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        ChatBubble(
                          message: 'Selamat Siang!',
                          isSender: false,
                        ),
                        ChatBubble(
                          message: 'Ada Yang bisa saya bantu?',
                          isSender: true,
                        ),
                        // Add more messages here for testing
                        ChatBubble(
                          message: 'Saya butuh informasi lebih lanjut.',
                          isSender: false,
                        ),
                        ChatBubble(
                          message: 'Tentu, ada yang bisa saya bantu?',
                          isSender: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tulis pesan...',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Tambahkan fungsi kirim pesan di sini.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  ChatBubble({required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
              radius: 12,
            ),
            SizedBox(width: 8),
            Text(message),
          ],
        ),
      ),
    );
  }
}