import 'package:equatable/equatable.dart';
import 'package:fruit_hup/core/entities/review_entity.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
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
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
    required this.expirationDate,
    required this.numberOfCalories,
    required this.unitAmount,
    this.urlImage,
    this.isOrganic = false,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeature,
  });

  @override
  List<Object?> get props => [code];
}
