class Item {
  final int id;
  final String name;
  final String description;
  final int price;
  final String? imageUrl;
  final int category;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': imageUrl,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['imageUrl'],
    );
  }
}

List<Item> items = [
  Item(
    category: 2,
    id: 1,
    description: 'Delicious chocolate cake with strawberries on top',
    imageUrl: 'assets/images/item1.png',
    name: 'Chocolate Strawberry Cake',
    price: 559,
  ),
  Item(
    id: 2,
    category: 1,
    description: 'Vanilla cake decorated with colorful sprinkles',
    imageUrl: 'assets/images/item2.png',
    name: 'Sprinkle Vanilla Cake',
    price: 759,
  ),
  Item(
    category: 1,
    id: 3,
    description: 'Classic red velvet cake with cream cheese frosting',
    imageUrl: 'assets/images/item3.png',
    name: 'Red Velvet Cake',
    price: 600,
  ),
  Item(
    category: 2,
    id: 4,
    description: 'Moist and fluffy lemon cake with lemon glaze',
    imageUrl: 'assets/images/item4.png',
    name: 'Lemon Drizzle Cake',
    price: 600,
  ),
  Item(
    category: 2,
    id: 5,
    description: 'Rich chocolate cake with a funny meme decoration',
    imageUrl: 'assets/images/item6.png',
    name: 'Meme Chocolate Cake',
    price: 600,
  ),
  Item(
    category: 2,
    id: 6,
    description: 'Sweet strawberry cake with whipped cream frosting',
    imageUrl: 'assets/images/item6.jpg',
    name: 'Strawberry Dream Cake',
    price: 600,
  ),
  Item(
    category: 3,
    id: 7,
    description: 'Colorful and fun birthday cake for celebrations',
    imageUrl: 'assets/images/item7.jpg',
    name: 'Birthday Party Cake',
    price: 600,
  ),
  Item(
    category: 1,
    id: 8,
    description: 'Happy anniversary cake with chocolate decorations',
    imageUrl: 'assets/images/item8.jpg',
    name: 'Chocolate Anniversary Cake',
    price: 600,
  ),
  Item(
    category: 2,
    id: 9,
    description: 'Moist carrot cake with cream cheese frosting',
    imageUrl: 'assets/images/item6.jpg',
    name: 'Carrot Cream Cake',
    price: 600,
  ),
  Item(
    category: 2,
    id: 10,
    description: 'Elegant wedding cake with floral decorations',
    imageUrl: 'assets/images/item7.jpg',
    name: 'Elegant Wedding Cake',
    price: 600,
  ),
];
