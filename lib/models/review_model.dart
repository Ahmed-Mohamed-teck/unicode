class Review {
  String? name;
  String? profileImage;
  double? rate;
  String? description;

  Review({this.name, this.profileImage, this.rate, this.description});

  Review.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImage = json['profileImage'];
    rate = json['rate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profileImage'] = profileImage;
    data['rate'] = rate;
    data['description'] = description;
    return data;
  }
}