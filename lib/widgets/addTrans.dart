import 'package:flutter/material.dart';

class AddTrans extends StatelessWidget {
  const AddTrans({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        TextField(decoration:InputDecoration(labelText: 'Title'),onChanged: (_){},),
        TextField(decoration:InputDecoration(labelText: 'amount'),keyboardType: TextInputType.numberWithOptions(decimal:true),onChanged: (_){},)
      ],),
    );
  }
}