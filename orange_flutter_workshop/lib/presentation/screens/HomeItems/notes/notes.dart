import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/business_logic/notes/notes_cubit.dart';
import 'package:orange_flutter_workshop/data/data_provider/local/sql_helperl.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/notes/details_of_note_screen.dart';
import 'package:orange_flutter_workshop/presentation/screens/HomeItems/notes/insertNotes.dart';
import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:sizer/sizer.dart';

// import 'package:orange_flutter_workshop/presentation/widgets/customText.dart';
class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is DatabaseCreate) {
          notesCubit.initialize();
        }
      },
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: CustomAppBar(title: "Notes")),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  InsertNotes()));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: SqlHelper.getAllRowsDB(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                        child: CustomText(
                      "There's No Data To Show",
                      fontSize: 20.sp,
                      textColor: Colors.black,
                    ));
                  }

                  //if there's  data in the list of notes
                  else {
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),

                          //list of notes
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return DetailsOfNoteScreen(
                                  title: snapshot.data[index].title,
                                  date: snapshot.data[index].date,
                                  description: snapshot.data[index].description,
                                );
                              }));
                            },

                            //title of note
                            title: CustomText(
                              "${snapshot.data[index].title}",
                              fontSize: 20.sp,
                              textColor: Colors.black,
                            ),

                            //date of note
                            subtitle: CustomText(
                              "${snapshot.data[index].date}",
                              fontSize: 20.sp,
                              textColor: Colors.black,
                            ),

                            //btn edit + btn delete
                            trailing: Wrap(
                              children: [
                                //btn edit
                                IconButton(
                                  onPressed: () {
                                    notesCubit.getOneNote(
                                        context,
                                        snapshot.data[index].id,
                                        snapshot.data[index].title,
                                        snapshot.data[index].description,
                                        snapshot.data[index].date);
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: 15.sp,
                                  color: AppColor.primaryColor,
                                ),

                                //btn delete
                                IconButton(
                                  onPressed: () {
                                    notesCubit.delete(snapshot.data[index].id);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: 15.sp,
                                  color: AppColor.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
