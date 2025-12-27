import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpdemo/Product.dart';
import 'package:httpdemo/ProductRequest.dart';
import 'package:http/http.dart' as http;

class ModifyProductScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final giaController = TextEditingController();
  final motaController = TextEditingController();
  final thumbnailController = TextEditingController();
  final giamGiaController = TextEditingController();

  ModifyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Tạo sản phẩm")),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap ten nguoi ban: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap gia san pham: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: giaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap mo ta san pham: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: motaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap link anh thumbnail: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: thumbnailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap giam gia: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: giamGiaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String ten = nameController.text;
                int gia = int.parse(giaController.text);
                String mota = motaController.text;
                String thumbnail = thumbnailController.text;
                int giamGia = int.parse(giamGiaController.text);
                final pr = ProductRequest(
                  tenNguoiBan: ten,
                  giaSp: gia,
                  motaSp: mota,
                  thumbnail: thumbnail,
                  giamgia: giamGia,
                );
                postProduct(pr, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text("Create", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void postProduct(ProductRequest pr, BuildContext context) async {
    final url = "http://10.0.2.2:8080/api/product/create";
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(pr.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Successfully")));
    } else {
      throw Exception("Can't not create product");
    }
  }
}
