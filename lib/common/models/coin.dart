class Coin {
  Coin({
    required this.id,
    this.img,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final String? img;
  final double price;

  factory Coin.fromMap(
      {required Map<String, dynamic> jsonValue,
      String? img,
      required double price}) {
    return Coin(
      id: jsonValue['asset_id'],
      name: jsonValue['name'],
      price: price,
      img: img,
    );
  }
}
