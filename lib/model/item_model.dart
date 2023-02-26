import 'package:food_feed/model/category_model.dart';

class Items {
  final String image;
  final String name;
  final String pieces;
  final double price;
  final double offerPrice;
  final String desc;
  final double rating;
  final List<String> sizes;
  final List<String> slider;
  final bool isPopular;
  final bool isFavourite;
  final CategoryModel category;

  Items(
      {required this.image,
      required this.name,
      required this.pieces,
      required this.price,
      required this.offerPrice,
      required this.desc,
      required this.rating,
      required this.sizes,
      required this.slider,
      required this.isPopular,
      required this.isFavourite,
      required this.category});

  static List<Items> get getItems => [
        Items(
          image: 'assets/images/popular/1-min.jpg',
          name: 'Item1',
          pieces: "10",
          price: 104.00,
          offerPrice: 0.0,
          desc:
              "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk sjkfhsdkj fhkjdshf ksdfhjksdf sdjksd kjshgkjs hkjdshksdjhkjsdksdkjk sdgskd",
          rating: 4.3,
          sizes: ["S", "M"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: false,
          isFavourite: true,
          category: CategoryModel.getcategories[0],
        ),
        Items(
          isFavourite: true,
          image: 'assets/images/popular/2-min.jpg',
          name: 'Item2',
          pieces: "20",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
          category: CategoryModel.getcategories[0],
        ),
        Items(
          category: CategoryModel.getcategories[0],
          isFavourite: false,
          image: 'assets/images/popular/3-min.jpg',
          name: 'Item3',
          pieces: "30",
          price: 110.00,
          offerPrice: 10.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[0],
          isFavourite: true,
          image: 'assets/images/popular/4-min.png',
          name: 'Item4',
          pieces: "40",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[0],
          isFavourite: false,
          image: 'assets/images/popular/5-min.jpg',
          name: 'Item5',
          pieces: "50",
          price: 130.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[0],
          isFavourite: false,
          image: 'assets/images/popular/6-min.jpg',
          name: 'Item6',
          pieces: "70",
          price: 150.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: true,
          image: 'assets/images/popular/2-min.jpg',
          name: 'Item1',
          pieces: "10",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: false,
          image: 'assets/images/popular/1-min.jpg',
          name: 'Item2',
          pieces: "20",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: true,
          image: 'assets/images/popular/3-min.jpg',
          name: 'Item3',
          pieces: "30",
          price: 110.00,
          offerPrice: 10.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: true,
          image: 'assets/images/popular/4-min.png',
          name: 'Item4',
          pieces: "40",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: false,
          image: 'assets/images/popular/6-min.jpg',
          name: 'Item5',
          pieces: "50",
          price: 130.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[1],
          isFavourite: true,
          image: 'assets/images/popular/5-min.jpg',
          name: 'Item6',
          pieces: "70",
          price: 150.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: false,
          image: 'assets/images/popular/3-min.jpg',
          name: 'Item1',
          pieces: "10",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: true,
          image: 'assets/images/popular/1-min.jpg',
          name: 'Item2',
          pieces: "20",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: true,
          image: 'assets/images/popular/2-min.jpg',
          name: 'Item3',
          pieces: "30",
          price: 110.00,
          offerPrice: 10.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: false,
          image: 'assets/images/popular/4-min.png',
          name: 'Item4',
          pieces: "40",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: true,
          image: 'assets/images/popular/5-min.jpg',
          name: 'Item5',
          pieces: "50",
          price: 130.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[2],
          isFavourite: true,
          image: 'assets/images/popular/6-min.jpg',
          name: 'Item6',
          pieces: "70",
          price: 150.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: true,
          image: 'assets/images/popular/1-min.jpg',
          name: 'Item1',
          pieces: "10",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: false,
          image: 'assets/images/popular/2-min.jpg',
          name: 'Item2',
          pieces: "20",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: true,
          image: 'assets/images/popular/3-min.jpg',
          name: 'Item3',
          pieces: "30",
          price: 110.00,
          offerPrice: 10.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: true,
          image: 'assets/images/popular/4-min.png',
          name: 'Item4',
          pieces: "40",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: false,
          image: 'assets/images/popular/5-min.jpg',
          name: 'Item5',
          pieces: "50",
          price: 130.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[3],
          isFavourite: true,
          image: 'assets/images/popular/6-min.jpg',
          name: 'Item6',
          pieces: "70",
          price: 150.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: false,
          image: 'assets/images/popular/1-min.jpg',
          name: 'Item1',
          pieces: "10",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: true,
          image: 'assets/images/popular/2-min.jpg',
          name: 'Item2',
          pieces: "20",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: true,
          image: 'assets/images/popular/3-min.jpg',
          name: 'Item3',
          pieces: "30",
          price: 110.00,
          offerPrice: 10.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: false,
          image: 'assets/images/popular/4-min.png',
          name: 'Item4',
          pieces: "40",
          price: 104.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: true,
          image: 'assets/images/popular/5-min.jpg',
          name: 'Item5',
          pieces: "50",
          price: 130.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
        Items(
          category: CategoryModel.getcategories[4],
          isFavourite: true,
          image: 'assets/images/popular/6-min.jpg',
          name: 'Item6',
          pieces: "70",
          price: 150.00,
          offerPrice: 0.0,
          desc: "fdshkjhjgkhdjghkjdfh gjhdfjhgjhfdjhg dfhgjfdhgkd ghkjdfhgjfdk",
          rating: 4.3,
          sizes: ["S", "M", "L"],
          slider: [
            'assets/images/popular/1-min.jpg',
            'assets/images/popular/2-min.jpg'
          ],
          isPopular: true,
        ),
      ];
}
