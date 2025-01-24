class LaptopModel {
  final String description;
  final String image;
  final String id;
  final String category;
  final String state;
  final num price;
  LaptopModel(
      {required this.description,
      required this.image,
      required this.id,
      required this.category,
      required this.state,
      required this.price});

  factory LaptopModel.fromjson(Map<String, dynamic> jsonData) {
    return LaptopModel(
        description: jsonData['description'],
        category: jsonData['category'],
        state: jsonData['status'],
        image: jsonData['image'],
        id: jsonData['_id'],
        price: jsonData['price']);
  }
}