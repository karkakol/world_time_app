import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String location; // location name for the UI
  String time;//time in that location
  String flag;//url to an asset flag Icon
  String url;//location url for api endpoint

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {//says that function is asynchronous

    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    //print(offset);

    //create DateTime object

    DateTime now  =  DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset))); // now must be updated

    time = now.toString();//set time property

  }
}


