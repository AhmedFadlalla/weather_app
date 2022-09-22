import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presentation/controller/get_country_weather_data_bloc.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/enum.dart';

import '../../domain/entities/five_days.dart';
import '../../shared/component/constants.dart';
import '../controller/get_country_weather_data_event.dart';
import '../controller/get_country_weather_data_state.dart';

class BaseWeatherHomeScreen extends StatelessWidget {
  String? city;

  BaseWeatherHomeScreen({Key? key, this.city}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => sl<GetCountryWeatherDataBloc>()
        ..add(GetCountryWeatherDataEvent(city!))..add(GetNextDaysWeatherDataEvent(city!)),
      child: BlocBuilder<GetCountryWeatherDataBloc, GetWeatherDataState>(
        builder: (context, state) {
          switch (state.countryWeatherDataState  ) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              var weather = state.countryWeatherData;
              switch(state.nextDaysWeatherDataState){

                case RequestState.loading:
                  return  const Center(child: CircularProgressIndicator());
                case RequestState.loaded:
                  var nextDays=state.nextDaysWeatherData;

                  return Scaffold(
                    body: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Center(
                            child: Row(
                              children: [
                               const Icon(
                                  Icons.location_on_rounded,
                                  color: Color(0xFF0007e9),
                                ),
                                Text(
                                  weather!.name,
                                  style: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF0007e9)),
                                ),
                              ],
                            ),
                          ),
                          leading: InkWell(
                            child: const CircleAvatar(
                              backgroundColor: mainColor,
                              radius: 8.0,
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: mainColor),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      height: 150,
                                      child:
                                      LottieBuilder.asset(Images.cloudy_mains),
                                    ),
                                    Text(weather.weather[0].description,
                                        style: GoogleFonts.notoSans(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${(weather.main.temp - 273.15).round().toString()}\u2103',
                                      style: GoogleFonts.notoSans(
                                          fontSize: 60, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Feels Like ${weather.main.feelsLike}',
                                      style: GoogleFonts.notoSans(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey.withOpacity(0.2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  buildWeatherData(
                                      image: 'assets/anims/cloudysun.json',
                                      data:
                                      "${(weather.main.tempMin - 273.15).round().toString()}\u2103"),
                                  buildWeatherData(
                                      image: 'assets/anims/speed.json',
                                      data: "${weather.wind.speed} km/h"),
                                  buildWeatherData(
                                      image: 'assets/anims/cloudynight.json',
                                      data: "${weather.main.pressure} PA"),
                                ],
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: height*0.12,),

                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                            Text(
                                "Today",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Color(0xFF0007e9)),

                            )
                          ],),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context,index)=>buildNextDayItem(nextDays[index]),
                                separatorBuilder: (context,index)=>const SizedBox(width: 22,),
                                itemCount: nextDays.length),
                          ),
                        )


                      ],
                    ),
                  );
                case RequestState.error:
                  return Center(child: Text(state.nextDaysWeatherDataMessage));
              }
            case RequestState.error:
              return Center(child: Text(state.countryWeatherDataMessage));
          }
        },
      ),
    );
  }

  Widget buildWeatherData({required String data, required String image}) =>
      Expanded(
        child: Column(
          children: [
            Lottie.asset(
              image,
              height: 70,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "$data ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      );
  Widget buildNextDayItem(BaseFiveDays model)=>Container(
    height: 100,
    width: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.withOpacity(0.2)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          Text(
            '${model.temp}\u2103',
            style: GoogleFonts.notoSans(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Lottie.asset('assets/anims/cloudynight.json'),
          const SizedBox(height: 15,),
          Text(
            '${model.date}:00',
            style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),

        ],
      ),
    ),
  );
}
