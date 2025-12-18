import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String url;
  final String tenSp;
  final String tenShop;
  final Function() onClick;

  const ProductItem({
    super.key,
    required this.url,
    required this.tenSp,
    required this.tenShop,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            child: Image.network(url, width: 50, height: 50, fit: BoxFit.fill),
          ),
          SizedBox(width: 10),
          Column(children: [Text(tenSp), SizedBox(height: 5), Text(tenShop)]),
        ],
      ),
    );
  }
}
