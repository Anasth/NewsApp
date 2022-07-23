// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/homeModule/controller/cacheHelper.dart';
import 'package:newsapp/homeModule/controller/dio_helper.dart';
import 'package:newsapp/homeModule/controller/homeCubit.dart';
import 'package:newsapp/homeModule/controller/homeStates.dart';
import 'package:newsapp/homeModule/view/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData('isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({
    this.isDark,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => homeCubit()
        ..changeAppMode(
          fromShared: isDark,
        ),
      child: BlocConsumer<homeCubit, homeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = homeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            themeMode: cubit.isDark == true ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor("262833"),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: HexColor('262833'),
                ),
                backgroundColor: HexColor('262833'),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor(
                  '262833',
                ),
                elevation: 20,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 20,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
