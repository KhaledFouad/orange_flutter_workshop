import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/presentation/widgets/MyTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(title: "Support")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MyTextFeild(
                    controller: nameController,
                    inputType: TextInputType.emailAddress,
                    label: "Name",
                    textAction: TextInputAction.next,
                    icon: Icon(Icons.people),
                    prefixIcon: true,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                    },
                    onChanged: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MyTextFeild(
                    controller: eMailController,
                    inputType: TextInputType.emailAddress,
                    label: "E-Mail",
                    textAction: TextInputAction.next,
                    icon: Icon(Icons.email),
                    prefixIcon: true,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your E-mail';
                      }
                    },
                    onChanged: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    maxLines: 50,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: "what's making you unhappy",
                      alignLabelWithHint: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 30),
                      floatingLabelStyle: const TextStyle(
                          color: Colors.orange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                      labelText: "ticket",
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
                    )),
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
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
