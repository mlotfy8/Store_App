import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textformfeild extends StatelessWidget {
  var controller, lable, valid,change,type;
  IconButton? suf;
  bool? obs;

  textformfeild(
      {this.controller, this.lable, this.valid, this.obs = false, this.suf,this.change,this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(keyboardType: type,
        controller: controller,
        validator: valid,onChanged: change,
        obscureText: obs!,
        decoration: InputDecoration(
            suffixIcon: suf,
            label: Text('$lable'),
            enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
