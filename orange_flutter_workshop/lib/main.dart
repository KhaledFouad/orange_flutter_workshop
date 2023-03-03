import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_flutter_workshop/business_logic/auth/login/login_cubit.dart';
import 'package:orange_flutter_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:orange_flutter_workshop/business_logic/notes/notes_cubit.dart';
import 'package:orange_flutter_workshop/data/data_provider/local/cache_helper.dart';
import 'package:orange_flutter_workshop/data/data_provider/remote/dio_helper.dart';

import 'package:orange_flutter_workshop/presentation/screens/AppLayout/MyMainScreen.dart';
import 'package:orange_flutter_workshop/presentation/screens/bar%20screens/home/Home.dart';
import 'package:orange_flutter_workshop/presentation/screens/splash/SplashScreen.dart';

import 'package:orange_flutter_workshop/presentation/styles/Colors.dart';
import 'package:sizer/sizer.dart';

import 'presentation/screens/HomeItems/notes/details_of_note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColor.primaryColor,
              ),
            ))),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
