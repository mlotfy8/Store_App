import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Services/update%20product.dart';

import '../Widgets/Custome Button.dart';
import '../Widgets/Custome Text Field.dart';
import '../model/product_model.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, price, description, image;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              textformfeild(
                change: (data) {
                  name = data;
                },
                lable: 'Product Name',
              ),
              SizedBox(
                height: 10,
              ),
              textformfeild(
                change: (data) {
                  price = data;
                },
                type: TextInputType.number,
                lable: 'Product Price',
              ),
              SizedBox(
                height: 10,
              ),
              textformfeild(
                change: (data) {
                  description = data;
                },
                lable: 'Product Description',
              ),
              SizedBox(
                height: 10,
              ),
              textformfeild(
                change: (data) {
                  image = data;
                },
                lable: 'Product Image',
              ),
              SizedBox(
                height: 20,
              ),
              CustomeButton(
                tap: () async {
                  try {
                    isloading = true;
                    setState(() {});
                    await UpdateProductService().updateProduct(
                        title: name == null ? product.title : name!,
                        price:
                            price == null ? product.price.toString() : price!,
                        desc: description == null
                            ? product.description
                            : description!,
                        image: image == null ? product.image : image!,
                        category: product.category,
                        id: product.id);
                    isloading = false;
                    setState(() {});
                    print('===================================Sucsses');
                  } catch (ex) {
                    isloading = false;
                    setState(() {});
                  }
                },
                text: 'Update',
              )
            ],
          ),
        ),
      ),
    );
  }
}
