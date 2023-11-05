class Pet {
  String id;
  String name;
  String gender;
  String shelterName;
  String shelterAddress;
  String breed;
  int friendliness;
  List<String> images;

  Pet._(
      {required this.name,
      required this.gender,
      required this.shelterAddress,
      required this.shelterName,
      required this.breed,
      required this.images,
      required this.friendliness,
      required this.id});

  static fromJson(Map<String, dynamic> json) {
    return Pet._(
        name: json["name"],
        gender: json["gender"],
        shelterAddress: json["shelter"]["address"],
        shelterName: json["shelter"]["name"],
        breed: json["breed"]["name"],
        images: List<String>.from(json["images"] as List),
        friendliness: json["breed"]["friendliness"],
        id: json["_id"].toString());
  }
}
