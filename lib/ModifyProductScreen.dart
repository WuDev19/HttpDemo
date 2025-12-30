import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:httpdemo/Product.dart';
import 'package:httpdemo/ProductRequest.dart';
import 'package:http/http.dart' as http;

class ModifyProductScreen extends StatelessWidget {
  final idController = TextEditingController();
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
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Sản phẩm")),
            body: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Nhap id san pham: "),
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextField(
                        controller: idController,
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
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 100,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      // childAspectRatio: 2 //tỉ lệ width / height
                      mainAxisExtent: 40,
                    ),
                    children: [
                      ElevatedButton(
                        onPressed: () async {
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
                          postProduct(pr).then((message) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
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
                          putProduct(int.parse(idController.text), pr).then((
                            message,
                          ) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          deleteProduct(int.parse(idController.text)).then((
                            message,
                          ) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                        ),
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String ten = nameController.text;
                          int gia = int.parse(giaController.text);
                          String mota = motaController.text;
                          String thumbnail = thumbnailController.text;
                          int giamGia = int.parse(giamGiaController.text);
                          print("$ten + $gia");
                          final pr = ProductRequest(
                            tenNguoiBan: ten,
                            giaSp: gia,
                            motaSp: mota,
                            thumbnail: thumbnail,
                            giamgia: giamGia,
                          );
                          patchProduct(int.parse(idController.text), pr).then((
                            message,
                          ) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                        ),
                        child: Text(
                          "Patch",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> postProduct(ProductRequest pr) async {
    final url = "http://10.0.2.2:8080/api/product/create";
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(pr.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return "Success";
    } else {
      throw Exception("Can't create product");
    }
  }

  Future<String> putProduct(int id, ProductRequest pr) async {
    final url = "http://10.0.2.2:8080/api/product/put/$id";
    final response = await http.put(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(pr.toJson()),
    );
    if (response.statusCode == 200) {
      return "Success";
    } else {
      throw Exception("Can't put product");
    }
  }

  Future<String> patchProduct(int id, ProductRequest pr) async {
    final url = "http://10.0.2.2:8080/api/product/patch/$id";
    final response = await http.patch(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(pr.toJson()),
    );
    if (response.statusCode == 200) {
      return "Success";
    } else {
      throw Exception("Can't patch product");
    }
  }

  Future<String> deleteProduct(int id) async {
    final url = "http://10.0.2.2:8080/api/product/delete/$id";
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 204) {
      return "Success";
    } else {
      throw Exception("Can't delete product");
    }
  }
}
