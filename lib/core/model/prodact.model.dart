import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/core/entities/review_entity.dart';
import 'package:fruit_hup/core/model/review_model.dart';

class AddProductModel {
  final String name;
  final String description;
  final num code;
  final num price;

  final bool isFeature;
  String? urlImage;
  final num expirationDate;
  bool isOrganic;
  final num numberOfCalories;
  final num unitAmount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;
  final num sellingCount;

  AddProductModel({
    required this.avgRating,
    required this.reviews,
    required this.sellingCount,
    required this.expirationDate,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.isOrganic,
    this.urlImage,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeature,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      AddProductModel(
        avgRating: json['avg_rating'] ?? 5,
        sellingCount: json['sellingCount'],
        name: json['name'],
        description: json['description'],
        urlImage: json['url_image'],
        code: json['code'],
        price: json['price'],
        isFeature: json['is_feature'],
        expirationDate: json['expiration_date'],
        numberOfCalories: json['number_of_calories'],
        unitAmount: json['unit_amount'],
        isOrganic: json['is_organic'],
        reviews: json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : [],
      );

  ProductEntity toEntity() => ProductEntity(
        name: name,
        description: description,
        urlImage: urlImage,
        code: code,
        price: price,
        isFeature: isFeature,
        expirationDate: expirationDate,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        reviews: reviews.map((e) => e.toEntity()).toList(),
      );

  toJson() => {
        'name': name,
        'description': description,
        'url_image': urlImage,
        'code': code,
        'price': price,
        'is_feature': isFeature,
        'expiration_date': expirationDate,
        'number_of_calories': numberOfCalories,
        'unit_amount': unitAmount,
        'is_organic': isOrganic,
        'avg_rating': avgRating,
        'rating_count': ratingCount,
        'sellingCount': sellingCount,
      };
}

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratting;
  }
  return sum / reviews.length;
}
