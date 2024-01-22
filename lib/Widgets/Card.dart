import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';

import '../Screens/UpdateProductPage.dart';

class CustomeCard extends StatelessWidget {
  CustomeCard({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 150,
          width: 180,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 60,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(5, 5))
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 10),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 50,
            top: -55,
            right: 50,
            bottom: 70,
            child: Image.network(
              product.image,
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ))
      ]),
    );
  }
}
