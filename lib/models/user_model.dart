



import 'package:unicodetask/models/review_model.dart';

/// this is fake user model class to simulate actual model data
class UserModel {
  String? name;
  String? profileImage;
  String? city;
  String? country;
  double? rate;
  String? sportType;
  String? description;
  List<String>? coachImages;
  List<String>? traineeImages;
  List<Review>? reviews;

  UserModel(
      {this.name,
        this.profileImage,
        this.city,
        this.country,
        this.rate,
        this.sportType,
        this.description,
        this.coachImages,
        this.traineeImages,
        this.reviews});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
    city = json['city'];
    country = json['country'];
    rate = json['rate'];
    sportType = json['sportType'];
    description = json['description'];
    coachImages = json['coachImages'].cast<String>();
    traineeImages = json['traineeImages'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profileImage'] = profileImage;
    data['city'] = city;
    data['country'] = country;
    data['rate'] = rate;
    data['sportType'] = sportType;
    data['description'] = description;
    data['coachImages'] = coachImages;
    data['traineeImages'] = traineeImages;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

