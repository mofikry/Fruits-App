import 'package:fruit_hup/core/entities/review_entity.dart';

class ReviewModel {
  String name;
  String image;
  num ratting;
  String date;
  String reviewdescraption;

  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewdescraption,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      ratting: reviewEntity.ratting,
      date: reviewEntity.date,
      reviewdescraption: reviewEntity.reviewdescraption,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        ratting: json['ratting'],
        date: json['date'],
        reviewdescraption: json['reviewDescription']);
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
        name: name,
        image: image,
        ratting: ratting,
        date: date,
        reviewdescraption: reviewdescraption);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewdescraption
    };
  }
}
