import 'package:httpdemo/Product.dart';

class Response {
  final int pageNumber;
  final int pageSize;
  final List<Product> contents;

  Response({
    required this.pageNumber,
    required this.pageSize,
    required this.contents,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      pageNumber: json["pageNumber"],
      pageSize: json["pageSize"],
      contents: (json["contents"] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'contents': contents,
    };
  }
}
