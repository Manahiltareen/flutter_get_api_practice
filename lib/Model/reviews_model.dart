import 'package:flutter/material.dart';

class ReviewsModel {
  final int id;
  final int partnerId;
  final int customerId;
  final int rating;
  final String comment;
  final String createdAt;
  final String updatedAt;

  ReviewsModel({
    required this.id,
    required this.partnerId,
    required this.customerId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
   });
  factory ReviewsModel.fromJson(Map<String, dynamic> toElement){
    return ReviewsModel(
      id : int.parse(toElement['id'].toString()),
      partnerId:int.parse(toElement['partnerId'].toString()),
      comment: toElement['comment'],
      createdAt:  toElement['createdAt'],
      customerId: int.parse(toElement['customerId'].toString()),
      rating: int.parse(toElement['rating'].toString()),
      updatedAt: toElement['updatedAt'],

    );

  }
}




