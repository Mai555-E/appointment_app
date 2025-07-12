class DoctorModel {
  late final String price;
  late final int id;
  late final String reviews;
  late final String bio;
  late final String name;
  late final String image;
  late final String working_days;
  late final String specialization;

  DoctorModel(
      {required this.name,
      required this.specialization,
      required this.bio,
      required this.id,
      required this.reviews,
      required this.image,
      required this.price,
      required this.working_days});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        id: json['id'],
        bio: json["bio"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        reviews: json['review'],
        working_days: json["working_days"],
        specialization: json["specialization"]);
  }
}
