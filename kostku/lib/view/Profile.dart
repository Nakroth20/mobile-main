import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var currentPosition = Rx<Position?>(null);
  var profileImage = Rx<File?>(null);
  var isVideo = Rx<bool>(false);
  var postController = TextEditingController();
  var editPostController = TextEditingController(); // Tambahkan ini
  var posts = <Map<String, dynamic>>[].obs;

  // Untuk menyimpan media file (gambar atau video)
  var postMediaFile = Rx<File?>(null);

  // Mengatur tab yang dipilih
  var selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    fetchPosts();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition.value = position;
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login'); // Sesuaikan dengan route Anda
  }

  Future<void> fetchPosts() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final snapshot = await _firestore
          .collection('posts')
          .where('userId', isEqualTo: user.uid)
          .orderBy('timestamp', descending: true)
          .get();

      posts.value = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'content': doc['content'],
          'mediaUrl': doc['mediaUrl'],
          'contentType': doc['contentType'],
          'timestamp': doc['timestamp'],
          'username': doc['username'],
        };
      }).toList();
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }

  Future<void> createPost(BuildContext context) async {
    final user = _auth.currentUser;
    if (user == null || postController.text.isEmpty) return;

    try {
      final post = {
        'userId': user.uid,
        'content': postController.text,
        'timestamp': Timestamp.now(),
        'username': user.displayName ?? user.email,
        'mediaUrl': postMediaFile.value?.path ?? '',
        'contentType': isVideo.value ? 'video' : 'image',
      };

      await _firestore.collection('posts').add(post);
      postController.clear();
      postMediaFile.value = null;
      fetchPosts(); // Refresh posts
    } catch (e) {
      print("Error creating post: $e");
    }
  }

  Future<void> editPost(int index, String newContent) async {
    final postId = posts[index]['id'];
    try {
      await _firestore.collection('posts').doc(postId).update({'content': newContent});
      posts[index]['content'] = newContent;
      posts.refresh(); // Refresh UI
    } catch (e) {
      print("Error editing post: $e");
    }
  }

  Future<void> deletePost(int index) async {
    final postId = posts[index]['id'];
    try {
      await _firestore.collection('posts').doc(postId).delete();
      posts.removeAt(index);
    } catch (e) {
      print("Error deleting post: $e");
    }
  }

  Future<void> pickImageOrVideo(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postMediaFile.value = File(pickedFile.path);
      isVideo.value = pickedFile.path.endsWith(".mp4");
    }
  }

  void removeImage() {
    postMediaFile.value = null;
  }
}