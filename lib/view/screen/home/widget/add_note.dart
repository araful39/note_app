import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/model/notes_model.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController noteController = Get.find<HomeController>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'title'.tr), // Translation
        ),
        TextFormField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'description'.tr), // Translation
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty &&
                descriptionController.text.isNotEmpty) {
              NoteModel note = NoteModel(
                id: '',
                title: titleController.text,
                description: descriptionController.text,
              );

              noteController.addNote(note);

              titleController.clear();
              descriptionController.clear();

              Get.back();
            } else {
              Get.snackbar('Error', 'error_fill_fields'.tr); // Translation
            }
          },
          child: Text('add_note'.tr), // Translation
        ),
      ],
    );
  }
}