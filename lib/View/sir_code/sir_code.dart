import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// API Response Model
class BannerModel {
  final int id;
  final String imageUrl;
  final String title;
  final String description;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
    );
  }
}

// Repository
class BannerRepository {
  final Dio _dio = Dio();

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response = await _dio.request(
        'https://rapiditadmin.mtai.live/api/home/banners',
        options: Options(method: 'GET'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => BannerModel.fromJson(json)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
  }
}

// GetX Controller
class BannerController extends GetxController {
  final BannerRepository _repository = BannerRepository();
  final banners = <BannerModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final bannerList = await _repository.fetchBanners();
      banners.assignAll(bannerList);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

// UI
class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.errorMessage.value.isNotEmpty
            ? Center(child: Text(controller.errorMessage.value))
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.banners.length,
          itemBuilder: (context, index) {
            final banner = controller.banners[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Text(
                controller.banners[index].title.toString(),
                // banner.title,
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text( controller.banners[index].description.toString()),
            //Text(banner.description),
            const SizedBox(height: 8),
            // Assuming imageUrl is a relative path, prepend with base URL
            Image.network(
              controller.banners[index].imageUrl.toString(),
            // 'https://rapiditadmin.mtai.live/${banner.imageUrl}',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.error),
            ),
            ],
            ),
            ),
            );
          },
        ),
      ),
    );
  }
}

// Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Banner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const BannerScreen(),
    );
  }
}