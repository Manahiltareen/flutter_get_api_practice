import 'package:flutter/material.dart';
import 'package:get_reviews/Model/Banners_model.dart';
import 'package:get_reviews/Services/Repositories/Banners_Repository.dart';



class BannerScreen extends StatelessWidget {
  String baseUrl = 'https://rapiditadmin.mtai.live/';

  final BannerRepository _repository = BannerRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Banners')),
      body: FutureBuilder<List<BannerModel>>(
        future: _repository.fetchBanners(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No banners available"));
          }

          final banners = snapshot.data!;

          return ListView.builder(
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://rapiditadmin.mtai.live/' + banner.imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          color: Colors.grey,
                          alignment: Alignment.center,
                          child: Icon(Icons.broken_image, size: 40),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(banner.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(banner.description),
                    ),
                  ],
                ),
              );

            },
          );
        },
      ),
    );
  }
}
