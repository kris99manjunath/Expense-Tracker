import 'package:flutter/material.dart';

import './cards.dart';


class TransactionView extends StatefulWidget {
  final trans;
  final remove;
  TransactionView(this.trans,this.remove);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<TransactionView> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
       child: Column(children: <Widget>[
            ...(widget.trans).map((tx){
              return Cards(tx.title,tx.amount,tx.date,tx.id,widget.remove);
            }).toList(), 
            ]),
    );
  }
}
