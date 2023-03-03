// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/business_logic/notes/notes_cubit.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/notes/notes.dart';
import 'package:orange_flutter_workshop/presentation/widgets/MyTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class InsertNotes extends StatefulWidget {
  InsertNotes({super.key});

  @override
  State<InsertNotes> createState() => _InsertNotesState();
}

class _InsertNotesState extends State<InsertNotes> {
  GlobalKey<FormState> addNoteKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      NotesCubit notesCubit = NotesCubit.get(context);
      return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: CustomAppBar(title: "Add Note")),
        body: Form(
          key: addNoteKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                  maxLines: 1,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Your Title';
                    } else if (val.length > 50) {
                      return "Title must be less than 50 characters";
                    }
                  },
                  onChanged: (value) {
                    notesCubit.title = value;
                  },
                  controller: notesCubit.titleController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    floatingLabelStyle: const TextStyle(
                        color: Colors.orange,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                    labelText: "Title",
                    labelStyle: const TextStyle(fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 2.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    controller: notesCubit.descriptionController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    maxLines: 50,
                    minLines: 1,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Your Description';
                      }
                    },
                    onChanged: (value) {
                      notesCubit.description = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      alignLabelWithHint: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 30),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                      labelText: "Description",
                      labelStyle: const TextStyle(fontSize: 23),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: const Size(150, 60),
                  ),
                  onPressed: () {
                    if (addNoteKey.currentState!.validate()) {
                      notesCubit.insert(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notes()));
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
