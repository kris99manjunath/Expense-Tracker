import 'package:flutter/material.dart';

import './models/transactions.dart';

class Cards extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final int id;
  final Function remove;
  
  Cards(@required this.title, @required this.amount, @required this.date,@required this.id,@required this.remove);
     
    
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      child: Card(
        //borderOnForeground: true,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            (amount < 0) ? Colors.red[300] : Colors.green[300],
                        width: 3),
                  ),
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(3),
                  child: Container(
                      width: 65,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        '₹${(amount < 0) ? -amount : amount}',
                        style: TextStyle(
                            color: (amount >= 0)
                                ? Colors.lightGreen[300]
                                : Colors.red[300],
                            fontSize: 15),
                      ))),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(date.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  )),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                  onPressed: ()=>remove(id),
                  
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      )),
            )
          ],
        ),
      ),
    );
  }
}
