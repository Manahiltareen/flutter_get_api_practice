import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_reviews/Constant/Controller/api_getx_controller.dart';

import 'package:get_reviews/Model/reviews_model.dart';
import 'package:get_reviews/View/review_card_widget.dart';

class ReviewScreen extends StatelessWidget {
  final ReviewController controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Reviews"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.reviews.isEmpty) {
          return Center(child: Text("No reviews found"));
        } else {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  ReviewsModel review = controller.reviews[index];
                  return ReviewCard(review: review);
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
