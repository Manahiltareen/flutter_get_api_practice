
import 'package:dio/dio.dart';
import 'package:get_reviews/Model/reviews_model.dart';

class ReviewsRepository {
  final Dio _dio = Dio();
  Future<List< ReviewsModel>> fetchReviews ()async{
    try{
       final response = await _dio.request(
         'https://rapiditadmin.mtai.live/api/home/reviews',
             options: Options(method: 'Get'),
       );
       if( response.statusCode == 200){
         final List<dynamic> data = response.data;
         return data.map((toElement) => ReviewsModel.fromJson(toElement)).toList();
       }
       else {
           throw Exception(response.statusMessage);
       }
    }
    catch(e){
      throw Exception('Failed to fetch reviews $e');

    }

  }

}