import 'package:flutter/material.dart';
import 'package:get_reviews/View/Banners_screen/Banners_screen.dart';
import 'package:get_reviews/View/Review_screen/reviews_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('GET API Practice'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context,
              label: 'Get Review API',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  ReviewScreen()),
                );
              },
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Banner List API',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  BannerScreen()),
                );
              },
              color: Colors.teal,
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Get Storage Example',
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => GetStorageScreen()),
                // );
              },
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label,
        required VoidCallback onPressed,
        required Color color}) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          shadowColor: Colors.black45,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
