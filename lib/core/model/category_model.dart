class CategoryModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  CategoryModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory CategoryModel.fromjson(Map<String, dynamic> jsondata) {
    return CategoryModel(
        id: jsondata['id'],
        title: jsondata['title'],
        price: jsondata['price'],
        description: jsondata['description'],
        category: jsondata['category'],
        image: jsondata['image'],
        rating: RatingModel.fromjson(jsondata['rating']));
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(jsondata) {
    return RatingModel(rate: jsondata['rate'], count: jsondata['count']);
  }
}
