import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpdemo/Product.dart';
import 'package:httpdemo/Response.dart';
import 'package:httpdemo/product_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          Text("Danh sách sản phẩm"),
          Expanded(
            //bọc trong expand để có thể gen được listview
            child: FutureBuilder(
              future: getProduct(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  //dang load
                  return const Center(child: CircularProgressIndicator());
                }
                if (asyncSnapshot.hasError) {
                  //case lỗi
                  print(asyncSnapshot.error.toString());
                  return Center(child: Text(asyncSnapshot.error.toString()));
                }
                if (asyncSnapshot.hasData) {
                  var response = asyncSnapshot.data as Response;
                  List<Product> listProduct = response.contents;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ProductItem(
                        url: listProduct[index].thumbnail,
                        tenSp: listProduct[index].motaSp,
                        tenShop: listProduct[index].tenNguoiBan,
                        onClick: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(listProduct[index].tenNguoiBan),
                                content: Text(listProduct[index].motaSp),
                                icon: Image.network(
                                  listProduct[index].thumbnail,
                                  height: 50,
                                  width: 50,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Hide"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    itemCount: listProduct.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                  );
                }
                return const SizedBox(); //thường thì sẽ ko chạy đến đây :))
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Response> getProduct() async {
    var api = "10.0.2.2:8080";
    final uri = Uri.http(api, "/api/sanpham/get", {"pageNumber": "0"});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(
        response.body,
      ); //kết quả trả về dạng string, phải decode sang json
      return Response.fromJson(json); //convert sang model
    } else {
      //ném lỗi để bên future builder bắt chỗ hasError
      print(response.body);
      throw Exception(response.body);
    }
  }
}
