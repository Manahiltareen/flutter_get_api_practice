import 'package:flutter/material.dart';
import 'package:get_reviews/Model/reviews_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewsModel review;

  const ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("⭐ Rating: ${review.rating}", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Comment:", style: TextStyle(fontWeight: FontWeight.w600)),
          Text(
            review.comment,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Text("Customer ID: ${review.customerId}", style: TextStyle(fontSize: 12, color: Colors.grey)),
          Text("Date: ${review.createdAt.split('T')[0]}", style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
