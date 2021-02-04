import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {//says that function is asynchronous

    //simulate network request foa a user name

    String username = await Future.delayed(Duration(seconds: 3), () {//calls delyed methos od Future object whitch takes Duration object with seconds as paramiter, await means that this code must executed and only later we do rest of code
      return('yoshi');
    });


    String bio = await Future.delayed(Duration(seconds: 2), () {
      return ('vege, pede, mene');
    });


    print('$username - $bio');

  }


  @override
  void initState() {
    super.initState();
    getData();
    print('hello faggots');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],

    );
  }
}
