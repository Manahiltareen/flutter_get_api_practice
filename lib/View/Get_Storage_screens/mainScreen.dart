import 'package:flutter/material.dart';
import 'package:get_reviews/View/Get_Storage_screens/FetchDataScreen.dart';
import 'package:get_reviews/View/Get_Storage_screens/add_name.dart';


class GetStorageScreen extends StatelessWidget {
  const GetStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Storage Screen'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (_) => AddName()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Add Data', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (_) => FetchDataScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('See Data', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
