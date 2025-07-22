import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstanta{
  //-------------app name--------------------
  static String appNAme="Savana";

  //-----------Base URL-------------
static String baseUrl='https://rapiditadmin.mtai.live';

//---------end points-----------------

//--------home screen end points-----------
static String reviews='/api/home/reviews';
static String banners='/api/home/banners';


}


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstanta.appNAme),
      ),
      body: Column(children: [
        Text('Welcome to ${AppConstanta.appNAme}')
      ],),
    );
  }
}
