class Products {
  String name;
  double price;

  Products({required this.name, required this.price});

  Products copyWith({String? name, double? price}) {
    return Products(name: name ?? this.name, price: price ?? this.price);
  }
}
