

import 'package:dio/dio.dart';
import 'package:get_reviews/Model/Banners_model.dart';


class BannerRepository {
  final Dio _dio = Dio();

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response = await _dio.get(
        'https://rapiditadmin.mtai.live/api/home/banners',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => BannerModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load banners');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
