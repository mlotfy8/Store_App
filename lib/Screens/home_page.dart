import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Services/get%20all%20product.dart';
import 'package:store_app/model/product_model.dart';

import '../Widgets/Card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black,fontSize: 18),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            )
          ],
        ),
        body: FutureBuilder<List<ProductModel>>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> product = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5, top: 70,bottom: 5),
                  child: GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 80,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => CustomeCard(
                            product: product[index],
                          ),itemCount: snapshot.data!.length,),
                );
              } else {
                Text('Error');
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: AllProductsService().getAllProducts()));
  }
}
