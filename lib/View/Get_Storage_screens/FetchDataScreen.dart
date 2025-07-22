import 'package:flutter/material.dart';
import 'package:get_reviews/Services/get_storage/get_storage.dart';
import 'package:get_reviews/View/Get_Storage_screens/mainScreen.dart';
import 'package:get_reviews/View/Home_Screen/home_screen.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  String userName='';
  String userEmail='';
  String userNumber='';
  DataManager controller = DataManager();
  getData()async{
     userName = await controller.getName();
    userEmail =await controller.getEmail();
    userNumber = await controller.getNumber();
     setState(() {

     });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Info'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person, color: Colors.lightBlue),
                title: const Text('Name'),
                subtitle: Text( userName),
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.lightBlue),
                title: const Text('Email'),
                subtitle: Text(userEmail),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone, color:Colors.lightBlue),
                title: const Text('Phone Number'),
                subtitle: Text(userNumber),
              ),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetStorageScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}

