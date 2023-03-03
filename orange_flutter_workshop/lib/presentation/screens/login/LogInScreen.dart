import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/business_logic/auth/login/login_cubit.dart';
import 'package:orange_flutter_workshop/constants/constant_methods.dart';
import 'package:orange_flutter_workshop/presentation/screens/AppLayout/MyMainScreen.dart';
import 'package:orange_flutter_workshop/presentation/screens/register/RegisterScreen.dart';
import 'package:orange_flutter_workshop/presentation/widgets/MyTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/flexTextFeild.dart';
import 'package:orange_flutter_workshop/presentation/widgets/passordTxt.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visible = false;
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        flutterToast(msg: 'Logged in Successfully', color: Colors.green);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MyMainScreen(),
            ),
            (route) => false);
      }
    }, builder: (context, state) {
      LoginCubit loginCubit = LoginCubit.get(context);
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Form(
                key: loginKey,
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
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Login",
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
                            controller: eMailController,
                            inputType: TextInputType.emailAddress,
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(500, 60),
                          ),
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              loginCubit.postLogin(
                                email: eMailController.text,
                                password: passwordController.text,
                              );
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyMainScreen()));
                          },
                          child: const Text(
                            'Login',
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      );
    });
  }
}
