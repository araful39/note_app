import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/view/screen/sign_in.dart';

class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<List<NoteModel>> getNotes() {
    return firestore.collection('notes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NoteModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> logOut() async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.signOut();
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Logged out successfully!');

      Get.offAll(() => const SignIn());
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Logout failed. Please try again.');

    }
  }

  Future<void> addNote(NoteModel note) async {
    try {
      await firestore.collection('notes').add(note.toJson());
      Get.snackbar('Success', 'Note added successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add note: $e');
    }
  }
  Future<void> deleteNote(String id) async {
    try {
      await firestore.collection('notes').doc(id).delete();
      Get.snackbar('Success', 'Note deleted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note: $e');
    }
  }
}
