
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
class LocationService{
  late  Location _location;
  bool _serviceEnable=false;
  PermissionStatus? _grantPermission;
  LocationService(){
    _location= Location();
  }


  Future<bool> _checkPermission() async{

    if(await _checkService())
      {
        _grantPermission=await _location.hasPermission();
        if(_grantPermission == PermissionStatus.denied){
          _grantPermission=await _location.requestPermission();
        }
      }
    return _grantPermission ==PermissionStatus.granted;
  }

  Future<bool> _checkService() async{

    try{
      _serviceEnable=await _location.serviceEnabled();
      if(!_serviceEnable)
        {
          _serviceEnable=await _location.requestService();
        }
    } on PlatformException catch(failure){
      print('error ${failure.code} message = ${failure.message}');
      _serviceEnable=false;
      await _checkService();
    }
    return _serviceEnable;
  }


  Future<LocationData?> getLocation()async{
    if(await _checkPermission()){
      final locationData=_location.getLocation();
      return locationData;
    }
    return null;
  }


  Future<geo.Placemark?>getplaceMark({
  required LocationData locationData
})async{
    final List<geo.Placemark> placeMarks=
    await geo.placemarkFromCoordinates(locationData.latitude!, locationData.longitude!);

    if( placeMarks.isNotEmpty){
      return placeMarks[0];
    }
return null;
  }
}