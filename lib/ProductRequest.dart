import 'package:httpdemo/Product.dart';

class ProductRequest {
  String tenNguoiBan;
  int giaSp;
  String motaSp;
  String thumbnail;
  int giamgia;

  ProductRequest({
    required this.tenNguoiBan,
    required this.giaSp,
    required this.motaSp,
    required this.thumbnail,
    required this.giamgia,
  });

  Map<String, dynamic> toJson(){
    return {
      "tenNguoiBan": tenNguoiBan,
      "giaSp": giaSp,
      "motaSp": motaSp,
      "thumbnail": thumbnail,
      "giamgia": giamgia
    };
  }

}
