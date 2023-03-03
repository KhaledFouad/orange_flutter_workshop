import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:orange_flutter_workshop/presentation/screens/login/LogInScreen.dart';
import 'package:orange_flutter_workshop/presentation/widgets/MyTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/passordTxt.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = false;
  bool visible2 = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String gender = 'm';
  void changeGender(val) {
    gender = val;
  }

  String dropdownValue = 'Gender';
  String dropdownValue2 = 'Grade';
  String dropdownValue3 = 'University';
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Form(
            key: registerKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Orange ",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Digital center",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    MyTextFeild(
                        controller: nameController,
                        inputType: TextInputType.name,
                        label: "Name",
                        textAction: TextInputAction.next,
                        icon: null,
                        prefixIcon: false,
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Name';
                          } else if (value.length > 32) {
                            return 'Name Must be less than 32 characters';
                          }
                        },
                        onChanged: () {}),
                    MyTextFeild(
                        controller: eMailController,
                        inputType: TextInputType.name,
                        label: "E-Mail",
                        textAction: TextInputAction.next,
                        icon: null,
                        prefixIcon: false,
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Email';
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                              .hasMatch(value)) {
                            return 'Please Enter Valid as example@gmail.com';
                          }
                        },
                        onChanged: () {}),
                    PasswordTxt(
                      secured: visible == false ? true : false,
                      control: passwordController,
                      icon: visible == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      ontap: () {
                        visible = !visible;
                        setState(() {});
                      },
                      Action: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      labelText: "Password",
                      onChanged: () {},
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                      },
                    ),
                    PasswordTxt(
                      secured: visible2 == false ? true : false,
                      control: passwordController2,
                      icon: visible2 == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      ontap: () {
                        visible2 = !visible2;
                        setState(() {});
                      },
                      Action: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      labelText: "Confirm Password",
                      onChanged: () {},
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: dropdownValue,
                          items: const <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: 'Gender',
                              child: Text('Gender'),
                            ),
                            DropdownMenuItem(
                              value: 'Male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem(
                              value: 'Female',
                              child: Text('Female'),
                            ),
                          ],
                          onChanged: (value) {
                            registerCubit.changeGender(value);
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.03,
                        ),
                        DropdownButton(
                          value: dropdownValue2,
                          items: const <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: 'Grade',
                              child: Text('Grade'),
                            ),
                            DropdownMenuItem(
                              value: 'Grade 1',
                              child: Text('Grade 1'),
                            ),
                            DropdownMenuItem(
                              value: 'Grade 2',
                              child: Text('Grade 2'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropdownValue2 = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.03,
                        ),
                        DropdownButton(
                          value: dropdownValue3,
                          items: const <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: 'University',
                              child: Text('University'),
                            ),
                            DropdownMenuItem(
                              value: 'AUC',
                              child: Text('AUC'),
                            ),
                            DropdownMenuItem(
                              value: 'KFC',
                              child: Text('KFC'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropdownValue3 = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(500, 60),
                      ),
                      onPressed: () {
                        if (registerKey.currentState!.validate()) {
                          registerCubit.postRegister(
                              name: nameController.text,
                              email: eMailController.text,
                              password: passwordController.text,
                              gender: "Male",
                              context: context);
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 7, right: 15),
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 7),
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 3.0,
                          color: Colors.orange,
                        ),
                        foregroundColor: Colors.orange,
                        shadowColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(500, 60),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      );
    });
  }
}
