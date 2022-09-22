import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_constant.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';
import 'package:weather_app/presentation/screens/splash_screen.dart';
import 'package:weather_app/shared/bloc_observer.dart';
import 'package:weather_app/shared/network/local/cach_helper.dart';
import 'package:weather_app/shared/network/remote/dio.dart';

import 'core/services/location_srevice.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await CachHelper.init();
  userArea=CachHelper.getData(key: 'geo');
  Widget widget;
  if(userArea !=null) {
    widget=BaseWeatherHomeScreen(city: userArea,);
  }else{
    widget=const SplashScreen();
  }
    runApp( MyApp( startWidget:widget,));

}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({Key? key,required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startWidget,
    );
  }
}


