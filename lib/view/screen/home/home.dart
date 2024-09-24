import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/view/screen/home/widget/add_note.dart';
import 'package:note_app/view/screen/home/widget/drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'notes_app'.tr, // Translation
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton<String>(
              child:  const Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Lang",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                ),
              ),
              onSelected: (String value) {
                if (value == 'English') {
                  Get.updateLocale(const Locale('en', ''));
                } else if (value == 'Hindi') {
                  Get.updateLocale(const Locale('hi', ''));
                } else if (value == 'Bengali') {
                  Get.updateLocale(const Locale('bn', ''));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(value: 'English', child: Text('English')),
                  const PopupMenuItem(value: 'Hindi', child: Text('हिन्दी')),
                  const PopupMenuItem(value: 'Bengali', child: Text('বাংলা')),
                ];
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<NoteModel>>(
        stream: homeController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('no_notes_available'.tr)); // Translation
          }

          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Show a confirmation dialog before deleting the note
                    Get.dialog(
                      AlertDialog(
                        title: Text('delete_note'.tr), // Translation
                        content: Text('delete_confirmation'.tr), // Translation
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('cancel'.tr), // Translation
                          ),
                          TextButton(
                            onPressed: () {
                              homeController.deleteNote(note.id);
                              Get.back();
                            },
                            child: Text('delete'.tr), // Translation
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.indigo),
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: Text('add_note'.tr), // Translation
              content: const AddNoteForm(),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('cancel'.tr), // Translation
                ),
              ],
            ),
          );
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}









