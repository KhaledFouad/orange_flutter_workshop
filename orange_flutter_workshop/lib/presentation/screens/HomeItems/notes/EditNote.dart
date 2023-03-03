// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:orange_flutter_workshop/business_logic/notes/notes_cubit.dart';
import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:orange_flutter_workshop/presentation/widgets/MyTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:sizer/sizer.dart';

//This Screen use for edit a note
class EditNotesScreen extends StatelessWidget {
  String title;
  int id;
  String description;
  TextEditingController editTitle = TextEditingController();
  TextEditingController editDescription = TextEditingController();

  EditNotesScreen({
    super.key,
    required this.description,
    required this.id,
    required this.title,
  });
  GlobalKey<FormState> editNoteKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(55),
                child: CustomAppBar(title: "Edit")),
            body: Form(
              key: editNoteKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    //Title
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
                        editTitle.text = value;
                      },
                      controller: editTitle,
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
                          editDescription.text = value;
                          print("description: $value");
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
                        if (editNoteKey.currentState!.validate()) {
                          notesCubit.update(
                            context,
                            id,
                            editTitle.text == "" ? title : editTitle.text,
                            editDescription.text == ""
                                ? description
                                : editDescription.text,
                            DateFormat("hh:mm a      dd/MM/yyyy")
                                .format(DateTime.now()),
                          );
                        }
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
