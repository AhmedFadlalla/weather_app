import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_constant.dart';
import 'package:weather_app/shared/network/local/cach_helper.dart';

import '../../core/services/location_srevice.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? lat,long,adminArea;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height*0.3,
            child: Container(
              child: Lottie.asset(
                  "assets/anims/result.json",

              ),
            ),
          ),
        ],
      ),
    );
  }

  void getLocation()async{

    final service=LocationService();
    final locationData=await service.getLocation();

    if(locationData !=null){
      final placeMark = await service.getplaceMark(locationData: locationData);
      setState(() {
        long=locationData.longitude!.toStringAsFixed(2);
        lat=locationData.latitude!.toStringAsFixed(2);
        adminArea=placeMark!.locality??"";
        if(userArea!=''){
         CachHelper.saveData(key: 'geo', value: adminArea).then((value) {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> BaseWeatherHomeScreen(city: adminArea,)));
         });
        }
      });

    }
  }



}
