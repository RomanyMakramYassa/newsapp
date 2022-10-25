//import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:metest/layout/shopapp/on%20bording/onBORDING.dart';
//import 'package:metest/layout/shopapp/on%20bording/onbordingscreen.dart';
//import 'package:metest/modules/counter/counter.dart';

import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cachhelper.dart';
import 'package:newsapp/shared/network/remote/diohelper.dart';
import 'package:newsapp/shared/styles/bloc_opserfer/bloc.dart';
import 'package:newsapp/shared/styles/themes.dart';
import 'dart:async';
import 'NewsApp/cubit.dart';
import 'NewsApp/newsapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Diohelper.init();
  await CachHelper.init();
  Widget Screen;

  // bool? onboarding = CachHelper.getdatashop(key: 'onboarding');
  // String? token = CachHelper.getdatashop(key: 'token');
  //print(onboarding.toString());
  bool? isDark = CachHelper.getdata(key: 'isDark');

  // social app

  runApp(MyApp(
    isDark: isDark,
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp(bool bool,
  //   {Key? key,this.isDark,this.onboarding})
  // : super(key: key);
  final bool? isDark;

  MyApp({this.isDark, screen});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getbusiness()
              ..GetScience()
              ..GetSports()),
        BlocProvider(create: (context) => AppCubit()..changmode(fromn: isDark)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //  home: BMI(),
            //home: hoooome(),
            //  home: Home_Layout(),
            //home: Text('sdfghjk'),

            //  home: CounterScreen(),
            /// nwewssssssssssssssssssss
            ///
            theme: lighttheme,
            darkTheme: derktheme,
            themeMode: AppCubit.getApp(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsScreen(),
            // home: NewsScreen(),
            //     home: Screen,
            // home: social_login(),
            //home: Social_Layout(),
//            home: WScreen,
            // home: onboarding? ShopLogin():ONBording()
            //home: Users(),
          );
        },
      ),
    );
  }
}
