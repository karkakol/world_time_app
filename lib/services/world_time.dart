import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag Icon
  String url; //location url for api endpoint
  bool isDayTime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //says that function is asynchronous

      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      //get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      //print(offset);

      //create DateTime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset))); // now must be updated

      isDayTime = now.hour > 6 && now.hour < 21 ? true : false;

      time = DateFormat.jm().format(now); //set time property




    } catch (e) {
      print('caught errot: $e');
      time = 'could not get time data';
    }
  }
}
