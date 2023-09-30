import 'dart:convert';

List<HouseModel> houseModelFromJson(String str) =>
    List<HouseModel>.from(json.decode(str).map((x) => HouseModel.fromJson(x)));

class HouseModel {
  int? bedrooms;
  String? categories;
  String? date;
  String? designerName;
  String? imageUrl;
  String? place;
  int? price;
  double? rating;
  String? propertyType;
  String? typeOfPlace;

  HouseModel({
    this.bedrooms,
    this.categories,
    this.date,
    this.designerName,
    this.imageUrl,
    this.place,
    this.price,
    this.rating,
    this.propertyType,
    this.typeOfPlace,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
        bedrooms: json["Bedrooms"],
        categories: json["Categories"],
        date: json["Date"],
        designerName: json["Designer Name"],
        imageUrl: json["Image URL"],
        place: json["Place"],
        price: json["Price"],
        rating: json["Rating"]?.toDouble(),
        propertyType: json["property_type"],
        typeOfPlace: json["type_of_place"],
      );
}
