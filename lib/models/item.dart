class Item {
  final int id;
  final String name;
  final String description;
  final int price;
  final String? imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}

List<Item> items = [
  Item(
      id: 1,
      description: 'Wow',
      imageUrl: 'assets/images/item1.jpg',
      name: 'Super-Cake',
      price: 559),
  Item(
      id: 2,
      description: 'Wow',
      imageUrl: 'assets/images/item2.jpg',
      name: 'Star',
      price: 759),
  Item(
      id: 3,
      description: 'Wow',
      imageUrl: 'assets/images/item3.jpg',
      name: 'Kirby',
      price: 600),
  Item(
      id: 4,
      description: 'Wow',
      imageUrl: 'assets/images/item4.jpg',
      name: 'Cake-cakes',
      price: 600),
  Item(
      id: 5,
      description: 'Wow',
      imageUrl: 'assets/images/item5.jpg',
      name: 'Meme-cake',
      price: 600),
  Item(
      id: 6,
      description: 'Wow',
      imageUrl: 'assets/images/item6.jpg',
      name: 'Strawberry',
      price: 600),
  Item(
      id: 7,
      description: 'Wow',
      imageUrl: 'assets/images/item7.jpg',
      name: 'Happy',
      price: 600),
  Item(
      id: 8,
      description: 'Wow',
      imageUrl: 'assets/images/item8.jpg',
      name: 'Happy 27!',
      price: 600),
  Item(
      id: 9,
      description: 'Wow',
      imageUrl: 'assets/images/item6.jpg',
      name: 'Happy',
      price: 600),
  Item(
      id: 10,
      description: 'Wow',
      imageUrl: 'assets/images/item7.jpg',
      name: 'Happy 27!',
      price: 600),
];
