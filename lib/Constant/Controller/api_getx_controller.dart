


import 'package:get/get.dart';
import 'package:get_reviews/Model/reviews_model.dart';
import 'package:get_reviews/Repositories/review_repository.dart';


class ReviewController extends GetxController{
  final ReviewsRepository _repository = ReviewsRepository();
  final reviews = <ReviewsModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    loadReviews();
  }

  Future<void> loadReviews() async{
    try{
      isLoading.value= true;
      errorMessage.value= '';
      final reviewList = await _repository.fetchReviews();
       reviews.assignAll(reviewList );

    }
    catch(e) {
      throw Exception(errorMessage.value = e.toString());
    }
    finally {
      isLoading.value = false;
    }
  }
}