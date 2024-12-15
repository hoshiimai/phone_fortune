class PointPackage {
  final int id;
  final String name;
  final int amount;
  final double price;
  final String? createdDate;

  PointPackage({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
    required this.createdDate,
  });

  factory PointPackage.fromJson(Map<String, dynamic> json) {
    return PointPackage(
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      price: json['price'],
      createdDate: json['created_date'],
    );
  }
}
