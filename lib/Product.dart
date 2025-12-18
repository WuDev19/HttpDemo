class Product {
  final int maSp;
  final String tenNguoiBan;
  final int giaSp;
  final String motaSp;
  final String thumbnail;
  final int giamgia;
  final int numberBought;
  final int maNguoiBan;

  Product({
    required this.maSp,
    required this.tenNguoiBan,
    required this.giaSp,
    required this.motaSp,
    required this.thumbnail,
    required this.giamgia,
    required this.numberBought,
    required this.maNguoiBan,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      maSp: json["maSp"],
      tenNguoiBan: json["tenNguoiBan"],
      giaSp: json["giaSp"],
      motaSp: json["motaSp"],
      thumbnail: json["thumbnail"],
      giamgia: json["giamgia"],
      numberBought: json["numberBought"],
      maNguoiBan: json["maNguoiBan"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maSp': maSp,
      'tenNguoiBan': tenNguoiBan,
      'giaSp': giaSp,
      'motaSp': motaSp,
      'thumbnail': thumbnail,
      'giamgia': giamgia,
      'numberBought': numberBought,
      'maNguoiBan': maNguoiBan,
    };
  }

}
