import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/bloc_observer.dart';
import 'package:weather_app/shared/network/local/cach_helper.dart';
import 'package:weather_app/shared/network/remote/dio.dart';

import 'muduls/home_screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherHomeScreen(),
    );
  }
}


