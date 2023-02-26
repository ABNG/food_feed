class CategoryModel {
  String image;
  String name;

  CategoryModel({required this.image, required this.name});

  static List<CategoryModel> get getcategories => [
        CategoryModel(
          image: 'assets/images/dog-min.png',
          name: "Dog",
        ),
        CategoryModel(
          image: 'assets/images/happy-min.png',
          name: "Cat",
        ),
        CategoryModel(
          image: 'assets/images/dove-min.png',
          name: "Bird",
        ),
        CategoryModel(
          image: 'assets/images/fish-min.png',
          name: "Fish",
        ),
        CategoryModel(
          image: 'assets/images/paw-min.png',
          name: "Toy",
        ),
      ];
}
