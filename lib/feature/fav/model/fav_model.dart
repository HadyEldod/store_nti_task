class FavModel {
  final String image;
  final String name;
  final num price;
  final String id;
  final String description;

  FavModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.id});

  factory FavModel.fromjson(Map<String, dynamic> jsonData) {
    return FavModel(
        name: jsonData['name'],
        id: jsonData['_id'],
        image: jsonData['image'],
        description: jsonData['description'],
        price: jsonData['price']);
  }
}
