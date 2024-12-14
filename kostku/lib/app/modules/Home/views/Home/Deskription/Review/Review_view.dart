import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('BUDIKOST', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Title and Image
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kost Putri Murah Nyaman (Kamar A1)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.network(
                  'assets/Kost1.jpg', // Replace with your image URL
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          // Review Section
          Expanded(
            child: Container(
              color: Colors.green[100],
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('riview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        ReviewBubble(text: 'sangat memuaskan', likes: 2, dislikes: 0),
                        ReviewBubble(text: 'baguss', likes: 1, dislikes: 0),
                        ReviewBubble(
                          text: 'kamar mandi ok, wastafel ok, kasur ok, pelayanan bagus,',
                          likes: 4,
                          dislikes: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Message Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.green[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.send, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewBubble extends StatelessWidget {
  final String text;
  final int likes;
  final int dislikes;

  ReviewBubble({required this.text, required this.likes, required this.dislikes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[200],
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 14)),
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16),
                    SizedBox(width: 4),
                    Text('$likes'),
                    SizedBox(width: 10),
                    Icon(Icons.thumb_down, size: 16),
                    SizedBox(width: 4),
                    Text('$dislikes'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
